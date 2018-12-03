if CLIENT then return end
util.AddNetworkString("joinmsg_connect")
util.AddNetworkString("joinmsg_spawn")
util.AddNetworkString("joinmsg_leave")
// Connected
local function joinmsg_connect(name, ip)
	net.Start("joinmsg_connect")
	if name == nil then
		name = "BOT"
		return
	end
	net.WriteString(name)
	net.Broadcast()
end
hook.Add( "PlayerConnect", "joinmsg_connect", joinmsg_connect )

// Spawn
local function joinmsg_spawn(ply)
	nick = ply:Nick()
	--[[
	if ply:SteamID() == "STEAM_0:0:62086150" then --Creed
		nick = "The Owner, " .. ply:Nick() .. ","
	elseif ply:SteamID() == "STEAM_0:0:46469216" then --Boris
		nick = "The Co-Owner, " .. ply:Nick() .. ","
	end]]
	net.Start("joinmsg_spawn")
	net.WriteString(nick)
	net.WriteString(ply:SteamID())
	net.Broadcast()
end

hook.Remove("PlayerInitialSpawn", "joinmsg_spawn", joinmsg_spawn )
hook.Add("PlayerFullyLoaded", "joinmsg_spawn", joinmsg_spawn )

// Disconnect
local function joinmsg_leave(ply)
	nick = ply:Nick()
	--[[
	if ply:SteamID() == "STEAM_0:0:62086150" then --Creed
		nick = "The Owner, " .. ply:Nick() .. ","
	elseif ply:SteamID() == "STEAM_0:0:46469216" then --Boris
		nick = "The Co-Owner, " .. ply:Nick() .. ","
	end]]--
	net.Start("joinmsg_leave")
	net.WriteString(nick)
	net.WriteString(ply:SteamID())
	net.Broadcast()
end
hook.Add("PlayerDisconnected", "joinmsg_leave", joinmsg_leave )
