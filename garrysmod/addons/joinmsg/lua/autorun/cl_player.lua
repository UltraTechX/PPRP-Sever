if SERVER then return end

// Connected
local function joinmsg_connect(name)
	if name == "D1gLaS pvpro.com" then return end
	chat.AddText( Color(191,255,127,255), name, " has connected to the server." )
	surface.PlaySound( "garrysmod/content_downloaded.wav" )
end
net.Receive("joinmsg_connect", function(len,ply)
	name = net.ReadString()
	joinmsg_connect(name)
end)

// Spawn
local function joinmsg_spawn( name, steamid)
	--[[if steamid == "STEAM_0:0:81672375" then
		if LocalPlayer():SteamID() == "STEAM_0:0:81672375" then
			chat.AddText( Color(191,255,127,255), name, " has spawned in. [", steamid, "]" )
			surface.PlaySound( "player/footsteps/dirt2.wav" )
		else
			chat.AddText( Color(191,255,127,255), "The owner, Hypsin, has spawned in. [", steamid, "]" )
			surface.PlaySound( "ambient/atmosphere/thunder2.wav" )
		end
	else]]--
		chat.AddText( Color(191,255,127,255), name, " has spawned in. [", steamid, "]" )
		surface.PlaySound( "player/footsteps/dirt2.wav" )
	--end -- :/
end
net.Receive("joinmsg_spawn", function(len,ply)
	name = net.ReadString()
	steamid = net.ReadString()
	joinmsg_spawn(name,steamid)
end)

// Disconnect
local function joinmsg_leave( name,steamid )
	chat.AddText( Color(191,255,127,255), name, " has disconnected. [", steamid, "]" )
	surface.PlaySound( "garrysmod/ui_return.wav" )
end
net.Receive("joinmsg_leave", function(len,ply)
	name = net.ReadString()
	steamid = net.ReadString()
	joinmsg_leave(name,steamid)
end)