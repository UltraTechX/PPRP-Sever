local TramToggleVar = 0
local function TramToggle(ply, args)
    if ply:CheckGroup( "TrialModerator" ) then
        if TramToggleVar == 0 then
            TramToggleVar = 1
            for k, v in pairs( ents.FindByName( "Tram" ) ) do
                v:SetMoveType(0)
                v:EmitSound("npc/scanner/scanner_explode_crash2.wav", 80, 100)
                v:EmitSound("npc/dog/dog_straining1.wav", 80, 100)
                v:EmitSound("ambient/machines/wall_ambient1.wav", 80, 100)
                v:EmitSound("ambient/machines/zap3.wav", 80,100)
            end
			for k, v in pairs( ents.FindByName( "Tram2" ) ) do
                v:SetMoveType(0)
                v:EmitSound("npc/scanner/scanner_explode_crash2.wav", 80, 100)
                v:EmitSound("npc/dog/dog_straining1.wav", 80, 100)
                v:EmitSound("ambient/machines/wall_ambient1.wav", 80, 100)
                v:EmitSound("ambient/machines/zap3.wav", 80,100)
            end
            for k, v in pairs( ents.FindByName( "TramDoor1") ) do
                v:Fire( "Open" )
            end
            for k, v in pairs( ents.FindByName( "TramDoor2") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "TramDoor3") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "TramDoor4") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "Tram2Door1") ) do
                v:Fire( "Open" )
            end
            for k, v in pairs( ents.FindByName( "Tram2Door2") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "Tram2Door3") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "Tram2Door4") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "TramCont1") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "TramCont2") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "TramCont3") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "TramCont4") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "TramCont5") ) do
                v:Fire( "Open" )
            end
			for k, v in pairs( ents.FindByName( "TramCont6") ) do
                v:Fire( "Open" )
            end
            ply:ChatPrint("Tram is now offline. (Tram Broken)")
        else
            TramToggleVar = 0
            for k, v in pairs( ents.FindByName( "Tram" ) ) do
                v:SetMoveType(7)
                v:EmitSound("npc/attack_helicopter/aheli_charge_up.wav", 80, 100)
                v:EmitSound("npc/scanner/cbot_energyexplosion1.wav", 80, 100)
                v:EmitSound("ambient/machines/wall_ambient1.wav", 80, 100)
            end
			for k, v in pairs( ents.FindByName( "Tram2" ) ) do
                v:SetMoveType(7)
                v:EmitSound("npc/attack_helicopter/aheli_charge_up.wav", 80, 100)
                v:EmitSound("npc/scanner/cbot_energyexplosion1.wav", 80, 100)
                v:EmitSound("ambient/machines/wall_ambient1.wav", 80, 100)
            end
            
            for k, v in pairs( ents.FindByName( "TramDoor1") ) do
                v:Fire( "Close" )
            end
            for k, v in pairs( ents.FindByName( "TramDoor2") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "TramDoor3") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "TramDoor4") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "Tram2Door1") ) do
                v:Fire( "Close" )
            end
            for k, v in pairs( ents.FindByName( "Tram2Door2") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "Tram2Door3") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "Tram2Door4") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "TramCont1") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "TramCont2") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "TramCont3") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "TramCont4") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "TramCont5") ) do
                v:Fire( "Close" )
            end
			for k, v in pairs( ents.FindByName( "TramCont6") ) do
                v:Fire( "Close" )
            end
            ply:ChatPrint("Tram is now online. (Tram Working)")
        end
    else
        ply:ChatPrint("You are not admin!")
    end
    return ""
end
DarkRP.defineChatCommand("tram", TramToggle, 1.5)

local function ChangeTemp(ply, args)
    if ply:CheckGroup( "TrialModerator" ) then
        for k, v in pairs( ents.FindByName( "Temperature" ) ) do
            if(tonumber(args)) then
                v:Fire( "SetValue" , tonumber(args) )
                ply:ChatPrint("Core temperature set to "..args.."!")
            else
                ply:ChatPrint("The argument given was not a number!")
            end
        end
    else
        ply:ChatPrint("You are not admin!")
    end
    return ""
end
DarkRP.defineChatCommand("temp", ChangeTemp, 1.5)

local function AntiRDM(ply, args)
    if ply:CheckGroup( "TrialModerator" ) then
    	if bmrp_rdmfield then
    		bmrp_rdmfield = false
    		ply:ChatPrint("Anti-RDM Field Disabled")
    	else
    		bmrp_rdmfield = true
    		ply:ChatPrint("Anti-RDM Field Enabled")
    	end
    else
        ply:ChatPrint("You are not admin!")
    end
    return ""
end
DarkRP.defineChatCommand("antirdm", AntiRDM, 1.5)

local PowerToggleVar = 0
local function togglePower(ply, args)
    if ply:CheckGroup( "TrialModerator" ) then
         if PowerToggleVar == 0 then
            PowerToggleVar = 1
            for k, v in pairs(player.GetAll()) do
                v:ChatPrint("Facility-Wide Power Failiure!")
            end
            for k, v in pairs(player.GetAll()) do
                v:EmitSound("ambient/machines/zap3.wav", 80, 100)
                timer.Simple( 0.5, function() print( v:EmitSound("ambient/alarms/klaxon1.wav", 80, 100) ) end )
                timer.Simple( 1.5, function() print( v:EmitSound("ambient/alarms/klaxon1.wav", 80, 100) ) end )
                timer.Simple( 2.5, function() print( v:EmitSound("ambient/alarms/klaxon1.wav", 80, 100) ) end )
            end
            timer.Simple( 4, function()
                for k, v in pairs( ents.FindByName( "CoreLights" ) ) do
                    v:Fire( "TurnOff" )
                end
            end)
            timer.Simple( 0.5, function()
                for k, v in pairs( ents.FindByName( "OOCLights" ) ) do
                    v:Fire( "TurnOff" )
                end
            end)
            timer.Simple( 2, function()
                for k, v in pairs( ents.FindByName( "UnderPowerLights" ) ) do
                    v:Fire( "TurnOff" )
                end
            end)
        else
            PowerToggleVar = 0
            for k, v in pairs(player.GetAll()) do
                v:ChatPrint("Power Restored!")
            end
            for k, v in pairs(player.GetAll()) do
                v:EmitSound("ambient/machines/thumper_startup1.wav", 80, 100)
                v:EmitSound("ambient/machines/zap3.wav", 80, 100)
            end
            timer.Simple( 0.5, function()
                for k, v in pairs( ents.FindByName( "CoreLights" ) ) do
                    v:Fire( "TurnOn" )
                end
            end)
            timer.Simple( 4, function()
                for k, v in pairs( ents.FindByName( "OOCLights" ) ) do
                    v:Fire( "TurnOn" )
                end
            end)
            timer.Simple( 2, function()
                for k, v in pairs( ents.FindByName( "UnderPowerLights" ) ) do
                    v:Fire( "TurnOn" )
                end
            end)
        end
    else
        ply:ChatPrint("You are not admin!")
    end
    return ""
end
DarkRP.defineChatCommand("power", togglePower, 1.5)