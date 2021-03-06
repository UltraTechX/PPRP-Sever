if !CustomBanMsg then CustomBanMsg = {} end
--[[ Settings ]]--

	CustomBanMsg.NotifyAll = true --If this is true, when a banned person tries joining, everyone will be notified in chat
	CustomBanMsg.NotifyOnlyAdmins = true -- If this is true, then it will only notify admins, if ULX or Evolve is enabled then anyone with specified permissions
	CustomBanMsg.AntiChatSpam = true -- Will show a message in chat(Of a persons failed join) only at minimum every SET time
	CustomBanMsg.AntiChatSpamTime = 60 -- Time to wait to send message again after a message has been sent. In seconds

	CustomBanMsg.Banned = {}

		CustomBanMsg.Banned.Msg =
		[[You have been banned by:
		{AdminName}

		For the reason of: 
		{Reason}

		Ban Time Left: 
		{TimeLeft}
		
		Appeal at "bans.cbmrp.org"
		]] -- Message that the banned person will get. {AdminName} = Admin's that banned them, name. {Reason} = Reason of the ban. {TimeBan} = Time of ban. {TimeLeft} = Time left until unban. {SteamID} = SteamID of the person.

		CustomBanMsg.Banned.ChatMsg = "{Name} tried to join the server while he/she is banned for {Reason}" -- {Name} = Persons name, {AdminName} = Admin's that banned them, name. {Reason} = Reason of the ban. {TimeBan} = Time of ban. {TimeLeft} = Time left until unban. {SteamID} = SteamID of the person.
		CustomBanMsg.Banned.ChatColor = Color(255,0,0) -- Color that the previous message will be

	CustomBanMsg.WrongPass = {}

		CustomBanMsg.WrongPass.Msg = [[
		--------------------------------------------------------------------
		                             Wrong password
		--------------------------------------------------------------------
		]] -- Message that anyone with wrong password will get

		CustomBanMsg.WrongPass.ChatMsg = "{Name} {SteamID} tried to join the server with a wrong password: {Pass}" -- {Name} = Persons name, {Pass} = Password that they tried to join with. {SteamID} = SteamID of the person.
		CustomBanMsg.WrongPass.ChatColor = Color(255,0,0) -- Color that the previous message will be


--[[ /Settings ]]-- DO NOT edit anything further than this, if you don't know what you are doing!!


--[[ Send colored chat message to player]]--
if SERVER then
	util.AddNetworkString("CustomBanMsgChat")
end

function CustomBanMsg.Chat(Ply, ...)
	if CLIENT then
		chat.AddText(...)
	elseif SERVER then
		if Ply == "All" then
			net.Start("CustomBanMsgChat")
				net.WriteTable({ ... })
			net.Broadcast()
		else
			if not IsValid(Ply) then return end
			net.Start("CustomBanMsgChat")
				net.WriteTable({ ... })
			net.Send(Ply)
		end
	end
end

if CLIENT then
	net.Receive("CustomBanMsgChat", function()
		chat.AddText(unpack( net.ReadTable() ) )
	end)
end
--[[ /Send colored chat message to player]]--