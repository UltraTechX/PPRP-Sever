hook.Add("PlayerInitialSpawn", "JoinedBeforeCheckBotShit", function(ply)
    print("BOT VARS FOR "..ply:SteamID())
    print("SetPAC "..util.GetPData(ply:SteamID(),"SetPAC",0))
    print("SetunPAC "..util.GetPData(ply:SteamID(),"SetunPAC",0))
    print("SetVIP "..util.GetPData(ply:SteamID(),"SetVIP",0))
    print("SetunVIP "..util.GetPData(ply:SteamID(),"SetunVIP",0))
	if util.GetPData(ply:SteamID(),"SetPAC",0) == 1 or util.GetPData(ply:SteamID(),"SetPAC",0) == "1" then
		RunConsoleCommand("ulx", "PAC", ply:SteamID())
        util.SetPData(ply:SteamID(),"SetPAC", 0)
    end
	if util.GetPData(ply:SteamID(),"SetunPAC",0) == 1 or util.GetPData(ply:SteamID(),"SetunPAC",0) == "1" then
		RunConsoleCommand("ulx", "unPAC", ply:SteamID())
        util.SetPData(ply:SteamID(),"SetunPAC", 0)
    end
	if util.GetPData(ply:SteamID(),"SetVIP",0) == 1 or util.GetPData(ply:SteamID(),"SetVIP",0) == "1" then
		RunConsoleCommand("ulx", "VIP", ply:SteamID())
        util.SetPData(ply:SteamID(),"SetVIP", 0)
    end
	if util.GetPData(ply:SteamID(),"SetunVIP",0) == 1 or util.GetPData(ply:SteamID(),"SetunVIP",0) == "1" then
		RunConsoleCommand("ulx", "unVIP", ply:SteamID())
        util.SetPData(ply:SteamID(),"SetunVIP", 0)
    end
end)