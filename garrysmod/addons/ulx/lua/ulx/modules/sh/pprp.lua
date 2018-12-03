local CATEGORY_NAME = "PPRP Custom Functions"

function ulx.findUser( calling_ply, target_ply )
	print( target_ply:SteamID() )
	print( target_ply:GetName() )
	print( target_ply:GetUserGroup() )
end
local findUser = ulx.command( CATEGORY_NAME, "ulx findUser", ulx.findUser, nil, false, false, true )
findUser:addParam{ type=ULib.cmds.PlayerArg }
findUser:defaultAccess( ULib.ACCESS_SUPERADMIN )
findUser:help( "Find a players SteamID/Nickname." )

function ulx.findUserID( calling_ply, steamid )

	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		print("Invalid steamid." )
		return
	end
	
	data = ULib.ucl.getUserInfoFromID( steamid )

		if not data then
			print("No information for provided id exists" )
		else
			print(steamid )
			print(data.name )
			print(data.group )
		end
end
local findUserID = ulx.command( CATEGORY_NAME, "ulx findUserID", ulx.findUserID, nil, false, false, true )
findUserID:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
findUserID:defaultAccess( ULib.ACCESS_SUPERADMIN )
findUserID:help( "Find a players SteamID/Nickname." )

function ulx.getUptime( calling_ply)
	curTime = SysTime()
	local days = math.floor(curTime/86400)
	  local hours = math.floor(math.fmod(curTime, 86400)/3600)
	  local minutes = math.floor(math.fmod(curTime,3600)/60)
	  local seconds = math.floor(math.fmod(curTime,60))
	print( string.format("%d:%02d:%02d:%02d",days,hours,minutes,seconds) )
end
local getUptime = ulx.command( CATEGORY_NAME, "ulx getUptime", ulx.getUptime, nil, false, false, true )
getUptime:defaultAccess( ULib.ACCESS_SUPERADMIN )
getUptime:help( "Gives the server uptime in seconds." )

function ulx.ping( calling_ply)
	print( "response" )
end
local ping = ulx.command( CATEGORY_NAME, "ulx ping", ulx.ping, nil, false, false, true )
ping:defaultAccess( ULib.ACCESS_SUPERADMIN )
ping:help( "Used by bot to detect if server is in a critical errored state." )

function ulx.avgPing( calling_ply)
	local Players = player.GetAll()
	if(table.Count(Players) ~= 0) then
		local averageping = 0
		Players = player.GetAll()
		for i = 1, table.Count(Players) do
			local ply = Players[i]
			averageping = averageping + tonumber(ply:Ping())
		end
		averageping = averageping/table.Count(Players)
		print("Average Player Ping: "..averageping.."MS")
		print(" ")
		print("Players:")
		for i = 1, table.Count(Players) do
			local ply = Players[i]
			print(ply:GetName().." : "..tonumber(ply:Ping()).."MS")
		end
	else
		print("No Players Online")
	end
end
local avgPing = ulx.command( CATEGORY_NAME, "ulx avgPing", ulx.avgPing, nil, false, false, true )
avgPing:defaultAccess( ULib.ACCESS_SUPERADMIN )
avgPing:help( "Gets players average average ping." )

function ulx.customStat( calling_ply)
	local Players = player.GetAll()
	print("SERVER STATUS: ")
	print(" ")
	
	print("Players Online: "..table.Count(Players))
	print(" ")
	
	local Players = player.GetAll()
	if(table.Count(Players) ~= 0) then
		local averageping = 0
		Players = player.GetAll()
		for i = 1, table.Count(Players) do
			local ply = Players[i]
			averageping = averageping + tonumber(ply:Ping())
		end
		averageping = averageping/table.Count(Players)
		print("Average Player Ping: "..averageping.."MS")
	else
		print("No Players Online")
	end
	
	print(" ")
	
	curTime = SysTime()
	local days = math.floor(curTime/86400)
	  local hours = math.floor(math.fmod(curTime, 86400)/3600)
	  local minutes = math.floor(math.fmod(curTime,3600)/60)
	  local seconds = math.floor(math.fmod(curTime,60))
	  print("Server Uptime: "..string.format("%d:%02d:%02d:%02d",days,hours,minutes,seconds).." Days:Hours:Mins:Seconds")
end
local customStat = ulx.command( CATEGORY_NAME, "ulx customStat", ulx.customStat, nil, false, false, true )
customStat:defaultAccess( ULib.ACCESS_SUPERADMIN )
customStat:help( "Gets the stats for the /status command." )

function ulx.propCount( calling_ply)
	local Players = player.GetAll()
	local pProps = {}
	if(table.Count(Players) ~= 0) then
		for i = 1, table.Count(Players) do
			pProps[i] = Players[i]:GetCount( "props" )
		end
		print("Top 5 prop users:")
		pPropsSort = pProps
		
		local idx = {}
		for i = 1, #pPropsSort do idx[i] = i end -- build a table of indexes
		  -- sort the indexes, but use the values as the sorting criteria
		table.sort(idx, function(a, b) return pPropsSort[a] > pPropsSort[b] end)
		
		for b = 1,5 do
			if (b <= table.Count(Players)) then
				print(b..". "..Players[idx[b]]:GetName().." - "..pProps[idx[b]])
			end
		end
	else
		print("No Players Online")
	end
end
local propCount = ulx.command( CATEGORY_NAME, "ulx propCount", ulx.propCount, nil, false, false, true )
propCount:defaultAccess( ULib.ACCESS_SUPERADMIN )
propCount:help( "Get top 5 prop users." )



function ulx.PAC( calling_ply, steamid )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		print("Invalid steamid." )
		return
	end
	
	--print("DEBUG: "..steamid)
	
	data = ULib.getPlyByID(	steamid)
	if(data ~= nil) then
		if (data:GetUserGroup() == "user") then
			RunConsoleCommand("ulx", "adduserid", steamid, "PACUser")
		elseif (data:GetUserGroup() == "VIP") then
			RunConsoleCommand("ulx", "removeuserid", steamid)
			RunConsoleCommand("ulx", "adduserid", steamid, "VIPPACUser")
		else
			print("Not eligible for PAC promotion/demotion! must either be user or VIP! (are they a staff role/noaccess?)")
		end
	else
		if(util.GetPData(steamid, "SetunPAC", 0) == 1) then
				util.SetPData(steamid, "SetunPAC", 0)
		end
		util.SetPData(steamid, "SetPAC", 1)
	end
end
local PAC = ulx.command( CATEGORY_NAME, "ulx PAC", ulx.PAC, nil, false, false, true )
PAC:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
PAC:defaultAccess( ULib.ACCESS_SUPERADMIN )
PAC:help( "PACs a players SteamID" )



function ulx.unPAC( calling_ply, steamid )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		print("Invalid steamid." )
		return
	end
	
	data = ULib.getPlyByID(	steamid)
		if (data ~= nil) then
			if (data:GetUserGroup() == "PACUser") then
				RunConsoleCommand("ulx", "removeuserid", steamid)
			elseif (data:GetUserGroup() == "VIPPACUser") then
				RunConsoleCommand("ulx", "removeuserid", steamid)
				RunConsoleCommand("ulx", "adduserid", steamid, "VIP")
			else
				print("Not eligible for PAC promotion/demotion! must either be PACuser or VIPPACUser! (are they a staff role/noaccess?)")
			end
		else
			if(util.GetPData(steamid, "SetPAC", 0) == 1) then
				util.SetPData(steamid, "SetPAC", 0)
			end
			util.SetPData(steamid, "SetunPAC", 1)
		end
end
local unPAC = ulx.command( CATEGORY_NAME, "ulx unPAC", ulx.unPAC, nil, false, false, true )
unPAC:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
unPAC:defaultAccess( ULib.ACCESS_SUPERADMIN )
unPAC:help( "UN-PACs a players SteamID" )

function ulx.VIP( calling_ply, steamid )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		print("Invalid steamid." )
		return
	end
	
	data = ULib.getPlyByID(	steamid)
	if(data ~= nil) then
		if (data:GetUserGroup() == "PACUser") then
			RunConsoleCommand("ulx", "removeuserid", steamid)
			RunConsoleCommand("ulx", "adduserid", steamid, "VIPPACUser")
		elseif(data:GetUserGroup() == "user") then
			RunConsoleCommand("ulx", "removeuserid", steamid)
			RunConsoleCommand("ulx", "adduserid", steamid, "VIP")
		end
	else
		if(util.GetPData(steamid, "SetunVIP", 0) == 1) then
			util.SetPData(steamid, "SetunVIP", 0)
		end
		util.SetPData(steamid, "SetVIP", 1)
	end
end
local VIP = ulx.command( CATEGORY_NAME, "ulx VIP", ulx.VIP, nil, false, false, true )
VIP:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
VIP:defaultAccess( ULib.ACCESS_SUPERADMIN )
VIP:help( "VIPs a players SteamID" )

function ulx.unVIP( calling_ply, steamid )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		print("Invalid steamid." )
		return
	end
	
	data = ULib.getPlyByID(	steamid)
	if(data ~= nil) then
		if (data:GetUserGroup() == "VIPPACUser") then
			RunConsoleCommand("ulx", "removeuserid", steamid)
			RunConsoleCommand("ulx", "adduserid", steamid, "PACUser")
		elseif(data:GetUserGroup() == "VIP") then
			RunConsoleCommand("ulx", "removeuserid", steamid)
		end
	else
		if(util.GetPData(steamid, "SetVIP", 0) == 1) then
			util.SetPData(steamid, "SetVIP", 0)
		end
		util.SetPData(steamid, "SetunVIP", 1)
	end
end
local unVIP = ulx.command( CATEGORY_NAME, "ulx unVIP", ulx.unVIP, nil, false, false, true )
unVIP:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
unVIP:defaultAccess( ULib.ACCESS_SUPERADMIN )
unVIP:help( "unVIPs a players SteamID" )

function ulx.screen( calling_ply, steamid )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		print("Invalid steamid." )
		return
	end
	
	data = ULib.getPlyByID(	steamid)
	sid64 = data:SteamID64()
	RunConsoleCommand("leyscreencap", "1", sid64)
	timer.Simple(0.1, function()
		RunConsoleCommand("leyscreencap", "2", sid64, tostring(1),  tostring(100), "0", tostring(3000))
	end)
end
local screen = ulx.command( CATEGORY_NAME, "ulx screen", ulx.screen, nil, false, false, true )
screen:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
screen:defaultAccess( ULib.ACCESS_SUPERADMIN )
screen:help( "screenshots a player" )

function ulx.getlayers( calling_ply)
	local Players = player.GetAll()
	if(table.Count(Players) ~= 0) then
		for i = 1, table.Count(Players) do
			local ply = Players[i]
			print(ply:GetName().."   |   "..ply:SteamID())
		end
	else
		print("No Players Online")
	end
end
local getlayers = ulx.command( CATEGORY_NAME, "ulx getlayers", ulx.getlayers, nil, false, false, true )
getlayers:defaultAccess( ULib.ACCESS_SUPERADMIN )
getlayers:help( "Gets all players" )

function ulx.kickID( calling_ply, steamid, reason )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		print("Invalid steamid." )
		return
	end

	target_ply = ULib.getPlyByID(	steamid)
	if(target_ply ~= nil) then 
		if target_ply:IsListenServerHost() then
			ULib.tsayError( calling_ply, "This player is immune to kicking", true )
			return
		end

		if reason and reason ~= "" then
			ulx.fancyLogAdmin( calling_ply, "#A kicked #T (#s)", target_ply, reason )
		else
			reason = nil
			ulx.fancyLogAdmin( calling_ply, "#A kicked #T", target_ply )
		end
		-- Delay by 1 frame to ensure the chat hook finishes with player intact. Prevents a crash.
		ULib.queueFunctionCall( ULib.kick, target_ply, reason, calling_ply )
	end
end
local kickID = ulx.command( CATEGORY_NAME, "ulx kickID", ulx.kickID, "!kickID" , nil, false, false, true )
kickID:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
kickID:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
kickID:defaultAccess( ULib.ACCESS_SUPERADMIN )
kickID:help( "Kicks target by SteamID." )