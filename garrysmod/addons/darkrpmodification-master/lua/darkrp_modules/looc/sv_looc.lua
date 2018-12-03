local function LOOC(ply, args)
   local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
            return ""
        end
        DarkRP.talkToRange(ply, "(" .. DarkRP.getPhrase("looc") .. ") " .. ply:Nick(), text, 550)
    end
    return args, DoSay
end
DarkRP.defineChatCommand("looc", LOOC, 1.5)
DarkRP.defineChatCommand("/.", LOOC, 1.5)