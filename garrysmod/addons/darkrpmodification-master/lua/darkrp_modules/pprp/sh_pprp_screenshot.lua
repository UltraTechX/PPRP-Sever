if SERVER then
    util.AddNetworkString("fcon_screenshot")
    net.Receive("fcon_screenshot",function(msglen,ply)
        local turnoff = net.ReadBool()
            if IsValid(ply) and ply:IsPlayer() then
                local link = net.ReadString()      
                local channel = net.ReadString()       
                --Post link'
                HCON.RelayToDiscord(link, channel)
            end
            hook.Remove("SetupPlayerVisibility", "fcon_screenshot_renderall")
    end)
    function ScreenshotPlayer(ply,channel)
        net.Start("fcon_screenshot")
            net.WriteBool(true)
            net.WriteString(channel)
        net.Send(ply)
    end
    function ScreenshotLoc(pos,ang,channel)
        local ply = nil
        local ping = 99999
        for k,v in pairs(player.GetHumans()) do
            if v:Ping() < ping then
                ping = v:Ping()
                ply = v
            end
        end
       
        hook.Add("SetupPlayerVisibility", "fcon_screenshot_renderall", function(ply,viewent)
            AddOriginToPVS(pos)--+Vector(0,0,-64))
        end)
        timer.Simple(1,function()
            net.Start("fcon_screenshot")
                net.WriteBool(false)
                net.WriteString(channel)
                net.WriteVector(pos)
                net.WriteAngle(ang)
            net.Send(ply)
        end)
    end
else
    local function DoScreenshot(channel,pos,ang,isplayer)
        if not(isplayer) then
            hook.Add("ShouldDrawLocalPlayer", "fcon_screenshot_rendertp", function(ply)
                return true
            end)
        end
        --render.DepthRange(0, 0)
        render.RenderView( {
            angles = ang,
            origin = pos,
            x = 0,
            y = 0,
            w = ScrW(),
            h = ScrH(),
            drawhud = isplayer,
            drawviewmodel = isplayer,
            aspectratio = ScrW()/ScrH(),
            fov = LocalPlayer():GetFOV(),
        } )
        local data = render.Capture( {
            format = "jpeg",
            quality = 100,
            x = 0,
            y = 0,
            w = ScrW(),
            h = ScrH(),
        } )
       
        --hook.Remove("PreDrawOpaqueRenderables", "fcon_screenshot_renderall")
        if not(isplayer) then
            hook.Remove("ShouldDrawLocalPlayer", "fcon_screenshot_rendertp")
        end
        data = util.Base64Encode( data )
        local title = ""
        if isplayer then
            title = "PPRP Screenshot of: "..LocalPlayer():Nick().." ["..LocalPlayer():SteamID().."]"
        else
            title = "PPRP Ingame Screenshot"
        end
        http.Post( "https://api.imgur.com/3/upload.json", { key="c7b921fb2239709aee957580cf4d4082e6ae4fc7", image=data, title=title },
        function( result )
            if result then
                local link = "ERROR"
                local delimiter = ","
                for v in (result..delimiter):gmatch("(.-)"..delimiter) do
                    if string.find(v, '^' .. '"link":') then
                        v = string.gsub(v,'"link":',"")
                        v = string.gsub(v,'"','')
                        v = string.gsub(v,'}','')
                        v = string.gsub(v,'\\','')
                        link = v
                        break
                    end
                end
                if link == "ERROR" or link == "" then
                    link = result
                end
                net.Start( "fcon_screenshot" )
                    net.WriteBool(false)
                    net.WriteString(link)
                    net.WriteString(channel)
                net.SendToServer()
            end
        end,
        function( failed )
            print("Failure!")
            net.Start( "fcon_screenshot" )
                net.WriteString("FAILED")
            net.SendToServer()
        end,
        {Authorization="Client-ID 6f0e29c94aca3a9"}     )
    end
    net.Receive( "fcon_screenshot", function()
        local isplayer = net.ReadBool()
        local channel = net.ReadString()
        local pos = Vector(0,0,0)
        local ang = Angle(0,0,0)
        if isplayer then
            pos = LocalPlayer():EyePos()
            ang = LocalPlayer():EyeAngles()    
        else
            pos = net.ReadVector()
            ang = net.ReadAngle()
        end
        DoScreenshot(channel,pos,ang,isplayer)
    end )
end

if SERVER then
    concommand.Add("screenshotall", function(ply, args)
        if not ply:IsValid() or ply:IsSuperAdmin() then
            for k,v in pairs(player.GetAll()) do 
                ScreenshotPlayer(v, "305536533065105419") 
            end
        end    
    end)
end