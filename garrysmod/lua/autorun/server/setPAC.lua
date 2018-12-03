hook.Add("PlayerInitialSpawn", "JoinedBefore", function(ply)
	if ply:GetPData("JoinedBefore", 0) == 0 then
		--RunConsoleCommand("ulx", "adduserid", ply:SteamID(), "PACUser")
        ply:SetPData("JoinedBefore", 1)
    end
end)