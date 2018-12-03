function Announce(ply, args)
    if args == "" then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
        return ""
    end
    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
            return
        end
		if(ply:Team() ~= TEAM_DIRECTOR and ply:Team() ~= TEAM_OWNER) then
			DarkRP.notify(ply, 1, 4, "You must be the director to make an announcement!")
            return
		end
        for k,v in pairs(player.GetAll()) do
            local col = team.GetColor(ply:Team())
            DarkRP.talkToPerson(v, col, "[Announcement] " .. ply:Nick(), Color(0, 200, 255, 255), text, ply)
        end
    end
    return args, DoSay
end
DarkRP.defineChatCommand("announce", Announce, 1.5)