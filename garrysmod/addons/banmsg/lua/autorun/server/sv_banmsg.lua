local LastMessage = 0

function CustomBanMsg.Access(Ply, Access)
	local HasAccess = false
	if Access == "Ban" then
		if ULib then
			HasAccess = ULib.ucl.query(Ply, "ulx ban")
		elseif evolve then
			HasAccess = Ply:EV_HasPrivilege("Ban")
		elseif serverguard then
			HasAccess = serverguard.player:HasPermission(Ply, "Unban")
		else
			HasAccess = Ply:IsAdmin()
		end
	end
return HasAccess
end

function CustomBanMsg.BanInfo(SteamID)
	local BanInfo = {}
	local Banned = false

		if ULib then
			local BanInfoRaw = ULib.bans[SteamID]
			if BanInfoRaw != nil then
				Banned = true
				BanInfo = {Admin = BanInfoRaw.admin, Reason = BanInfoRaw.reason, Time = BanInfoRaw.time, Unban = BanInfoRaw.unban}
			end
		elseif evolve then
			local uniqueID = evolve:UniqueIDByProperty("SteamID", SteamID)
			local BanAdmin = evolve:GetProperty(uniqueID, "BanAdmin")
			local BanAdminName = evolve:GetProperty(BanAdmin, "Nick")
			local BanReason = evolve:GetProperty(uniqueID, "BanReason")
			local Unban = evolve:GetProperty(uniqueID, "BanEnd")

			if Unban != nil then
				Banned = true
				BanInfo = {Admin = BanAdminName, Reason = BanReason, Time = 0, Unban = Unban}
			end
		elseif exsto then
			exsto.BanDB:GetRow(SteamID, function(q, d)
				if not d then return end
				local BannedAt, BanLen, BanReason, BannedBy = tonumber(d.BannedAt), tonumber(d.Length) * 60, d.Reason, d.BannedBy
				local Unban = 0
				if BanLen == 0 then
					Unban = BanLen
				else
					Unban = BannedAt + BanLen
				end
				if os.time() < BannedAt + BanLen || BanLen == 0 then
					Banned = true
					BanInfo = {Admin = BannedBy, Reason = BanReason, Time = BannedAt, Unban = Unban}
				end
			end)
		elseif serverguard then
			local BanInfoRaw = serverguard.banTable[SteamID]
			if BanInfoRaw != nil then
				local endTime = tonumber(BanInfoRaw.endTime)
				if endTime == 0 || endTime >= os.time() then
					Banned = true
					BanInfo = {Admin = BanInfoRaw.admin, Reason = BanInfoRaw.reason, Time = tonumber(BanInfoRaw.startTime), Unban = endTime}																																																																																																																																																						--21439297
				end
			end
		end
return BanInfo, Banned
end

hook.Add("PostGamemodeLoaded","CustomBanMsgPostGamemodeLoaded", function()
	hook.Add("CheckPassword", "CustomBanMsgCheckPassword", function(SteamID64, IP, ServerPass, ClientPass, ClientName)
		local SteamID = util.SteamIDFrom64(SteamID64)
		if ServerPass != "" && ServerPass != ClientPass then
			local SendChatMsg = string.gsub(CustomBanMsg.WrongPass.ChatMsg, "{SteamID}", SteamID)
				SendChatMsg = string.gsub(SendChatMsg, "{Pass}", ClientPass)
				SendChatMsg = string.gsub(SendChatMsg, "{Name}", ClientName)

			if LastMessage + (CustomBanMsg.AntiChatSpamTime or 60) < os.time() && CustomBanMsg.AntiChatSpam then
					if CustomBanMsg.NotifyOnlyAdmins then
						for n,j in pairs(player.GetAll() ) do
							if CustomBanMsg.Access(j, "Ban") then
								CustomBanMsg.Chat(j, CustomBanMsg.WrongPass.ChatColor, SendChatMsg)
							end
						end
					elseif CustomBanMsg.NotifyAll then
						CustomBanMsg.Chat("All", CustomBanMsg.WrongPass.ChatColor, SendChatMsg)
					end
				LastMessage = os.time()
			end
			MsgC(CustomBanMsg.WrongPass.ChatColor, SendChatMsg .. "\n")

		return false, CustomBanMsg.WrongPass.Msg
		end

		local BanInfo, Banned = CustomBanMsg.BanInfo(SteamID)

		if Banned then
			local BanTime = ""
			if BanInfo.Time == 0 then
				BanTime = "Unknown"
			else
				BanTime = os.date("%d/%m/%y %H:%M", BanInfo.Time)
			end
			local BanLeft = BanInfo.Unban - os.time()
			local BanText = ""
			local BanDays = 0
			local BanHours = 0
			local PermaBan = false
			if BanInfo.Unban == "0" || BanInfo.Unban == 0 then
				PermaBan = true
			end
			if PermaBan then
				BanText = "Forever"
			else
				if BanLeft > 86400 then
					while BanLeft > 86400 do
						BanLeft = BanLeft - 86400
						BanDays = BanDays + 1
					end
				end

				BanHours = os.date("!%X",BanLeft)

				if BanDays > 0 then
					BanText = BanDays .. " days " .. BanHours
				else
					BanText = BanHours
				end

			end

			local SendChatMsg = string.gsub(CustomBanMsg.Banned.ChatMsg, "{TimeLeft}", BanText or "")
				SendChatMsg = string.gsub(SendChatMsg, "{Reason}", BanInfo.Reason or "")
				SendChatMsg = string.gsub(SendChatMsg, "{SteamID}", SteamID)
				SendChatMsg = string.gsub(SendChatMsg, "{AdminName}", BanInfo.Admin or "Unknown")
				SendChatMsg = string.gsub(SendChatMsg, "{TimeBan}", BanTime or "")
				SendChatMsg = string.gsub(SendChatMsg, "{Name}", ClientName)

			local SendPlayerMsg = string.gsub(CustomBanMsg.Banned.Msg, "{AdminName}", BanInfo.Admin or "Unknown")
				SendPlayerMsg = string.gsub(SendPlayerMsg, "{Reason}", BanInfo.Reason or "")
				SendPlayerMsg = string.gsub(SendPlayerMsg, "{SteamID}", SteamID)
				SendPlayerMsg = string.gsub(SendPlayerMsg, "{TimeBan}", BanTime or "")
				SendPlayerMsg = string.gsub(SendPlayerMsg, "{TimeLeft}", BanText or "")

			if LastMessage + (CustomBanMsg.AntiChatSpamTime or 60) < os.time() && CustomBanMsg.AntiChatSpam then
				if CustomBanMsg.NotifyOnlyAdmins then
					for n,j in pairs(player.GetAll() ) do
						if CustomBanMsg.Access(j, "Ban") then
							CustomBanMsg.Chat(j, CustomBanMsg.Banned.ChatColor, SendChatMsg)
						end
					end
				elseif CustomBanMsg.NotifyAll then
					CustomBanMsg.Chat("All", CustomBanMsg.Banned.ChatColor, SendChatMsg)
				end
				LastMessage = os.time()
			end
			MsgC(CustomBanMsg.Banned.ChatColor, SendChatMsg .. "\n")

		return false, SendPlayerMsg
		end
	end)
end)