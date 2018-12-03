DarkRP.removeChatCommand("/")
DarkRP.removeChatCommand("a")
DarkRP.removeChatCommand("ooc")

local rankTitles = {
    ["superadmin"] = "Super Administrator",
    ["Owner"] = "Owner",
    ["admin"] = "Administrator",
    ["Moderator"] = "Moderator",
    ["TrialModerator"] = "Trial Moderator",
}
local steamTitles = {}

local OOCState = true

local function OOC(ply, args)
    if not GAMEMODE.Config.ooc then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("disabled", DarkRP.getPhrase("ooc"), ""))
        return ""
    end
    if !OOCState and !ply:IsAdmin() then
        DarkRP.notify(ply, 1, 4, "OOC is currently disabled.")
        return ""
    end

    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
            return ""
        end
        local col = team.GetColor(ply:Team())
        local col2 = Color(255,255,255,255)
        local title = steamTitles[ply:SteamID()] or rankTitles[ply:GetUserGroup()] or "Player"
        if not ply:Alive() then
            col2 = Color(255,200,200,255)
            col = col2
        end
            for k,v in pairs(player.GetAll()) do
                DarkRP.talkToPerson(v, col, "("..title..") (" .. DarkRP.getPhrase("ooc") .. ") " .. ply:Name(), col2, text, ply)
            end
        end
    return args, DoSay
end
DarkRP.defineChatCommand("/", OOC, true, 1.5)
DarkRP.defineChatCommand("a", OOC, true, 1.5)
DarkRP.defineChatCommand("ooc", OOC, true, 1.5)

local function DisableOOC(ply, args)
    if !ply:IsSuperAdmin() then
        ply:ChatPrint("You are not Super Admin!")
        return ""
    end
    
    OOCState = !OOCState
    if OOCState == false then
        ply:ChatPrint("OOC Disabled")
    else
        ply:ChatPrint("OOC enabled")
    end
end