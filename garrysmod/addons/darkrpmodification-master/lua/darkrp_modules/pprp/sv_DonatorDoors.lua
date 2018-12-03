function CheckInRange(vec1,vec2,vecx)
    local vecmin_x = math.min(vec1[1],vec2[1])
    local vecmin_y = math.min(vec1[2],vec2[2])
    local vecmin_z = math.min(vec1[3],vec2[3])
    
    local vecmax_x = math.max(vec1[1],vec2[1])
    local vecmax_y = math.max(vec1[2],vec2[2])
    local vecmax_z = math.max(vec1[3],vec2[3])    
    if ((vecx[1] >= vecmin_x and vecx[1] <= vecmax_x) and (vecx[2] >= vecmin_y and vecx[2] <= vecmax_y) and (vecx[3] >= vecmin_z and vecx[3] <= vecmax_z)) then
        return true
    else
        return false
    end
end

function SpecialAccess(ply)
    if ply:CheckGroup("VIP") then
        return true
    end
    return false
end
-- DOOR CODE
local function RejectTunns(ply)
    if ply:IsPlayer() then
        ply:ChatPrint("Fast-Travel tunnels are for donators only!")
        local vel = ply:GetVelocity()
        vel = Vector(vel[1]*-5,vel[2]*-5,vel[3])
        ply:SetVelocity(vel)
    end
end
 



 
local function ToOffices()
    local ents = ents.FindInBox( Vector(2361.052002, 14284.270508, -15.969055), Vector(2456.394043, 14263.141602, -15.968750))    
    for k, ply in pairs( ents ) do
        if ply:IsPlayer() then
            if not SpecialAccess(ply) then RejectTunns(ply) return end
            sound.Play("doors/handle_pushbar_open1.wav",ply:GetPos(),75,100,0.25)
            ply:SetPos(DarkRP.findEmptyPos(Vector(3077.578125, 6164.328613, -15.968750), {ply}, 600, 10, Vector(16, 16, 64)))
            ply:SetVelocity(Vector(0,0,0))
            if ply:IsPlayer() then
                sound.Play("doors/handle_pushbar_locked1.wav",ply:GetPos(),75,100,0.5)
                ply:ChatPrint("You take the tunnel and arrive at The Offices.")
                ply:SetEyeAngles(Angle(0,-90,0))
            end
        end
    end
end

local function ToLobbyOne()
    local ents = ents.FindInBox( Vector(3040.811523, 6380.930176, -15.970276), Vector(3138.330811, 6360.760254, -15.970276))    
    for k, ply in pairs( ents ) do
        if ply:IsPlayer() then
            if not SpecialAccess(ply) then RejectTunns(ply) return end
            sound.Play("doors/handle_pushbar_open1.wav",ply:GetPos(),75,100,0.25)
            ply:SetPos(DarkRP.findEmptyPos(Vector(2400.559814, 14025.041016, -15.968750), {ply}, 600, 10, Vector(16, 16, 64)))
            ply:SetVelocity(Vector(0,0,0))
            if ply:IsPlayer() then
                sound.Play("doors/handle_pushbar_locked1.wav",ply:GetPos(),75,100,0.5)
                ply:ChatPrint("You take the tunnel and arrive in The Lobby.")
                ply:SetEyeAngles(Angle(0,-90,0))
            end
        end
    end
end

local function ToLabs()
    local ents = ents.FindInBox( Vector(-2444.166992, 14285.930664, -15.969345), Vector(-2350.617920, 14261.758789, -15.969345))    
    for k, ply in pairs( ents ) do
        if ply:IsPlayer() then
            if not SpecialAccess(ply) then RejectTunns(ply) return end
            sound.Play("doors/handle_pushbar_open1.wav",ply:GetPos(),75,100,0.25)
            ply:SetPos(DarkRP.findEmptyPos(Vector(-3106.114014, 6142.141602, -15.968750), {ply}, 600, 10, Vector(16, 16, 64)))
            ply:SetVelocity(Vector(0,0,0))
            if ply:IsPlayer() then
                sound.Play("doors/handle_pushbar_locked1.wav",ply:GetPos(),75,100,0.5)
                ply:ChatPrint("You take the tunnel and arrive at The Labs.")
                ply:SetEyeAngles(Angle(0,-90,0))
            end
        end
    end
end

local function ToLobbyTwo()
    local ents = ents.FindInBox( Vector(-3147.426514, 6380.929688, -15.969032), Vector(-3049.402588, 6370.176270, -15.969032))    
    for k, ply in pairs( ents ) do
        if ply:IsPlayer() then
            if not SpecialAccess(ply) then RejectTunns(ply) return end
            sound.Play("doors/handle_pushbar_open1.wav",ply:GetPos(),75,100,0.25)
            ply:SetPos(DarkRP.findEmptyPos(Vector(-2399.932861, 14057.313477, -15.968750), {ply}, 600, 10, Vector(16, 16, 64)))
            ply:SetVelocity(Vector(0,0,0))
            if ply:IsPlayer() then
                sound.Play("doors/handle_pushbar_locked1.wav",ply:GetPos(),75,100,0.5)
                ply:ChatPrint("You take the tunnel and arrive in The Lobby.")
                ply:SetEyeAngles(Angle(0,-90,0))
            end
        end
    end
end

local function ToLLTele()
    local ents = ents.FindInBox( Vector(1815.622192, -3744.336670, -2293.967773), Vector(1718.093140, -3735.663086, -2293.967773))    
    for k, ply in pairs( ents ) do
        if ply:IsPlayer() then
            if not SpecialAccess(ply) then RejectTunns(ply) return end
            sound.Play("doors/handle_pushbar_open1.wav",ply:GetPos(),75,100,0.25)
            ply:SetPos(DarkRP.findEmptyPos(Vector(384.374054, 6484.849121, -2293.968750), {ply}, 600, 10, Vector(16, 16, 64)))
            ply:SetVelocity(Vector(0,0,0))
            if ply:IsPlayer() then
                sound.Play("doors/handle_pushbar_locked1.wav",ply:GetPos(),75,100,0.5)
                ply:ChatPrint("You take the tunnel and arrive at The Lower Level Teleporter.")
                ply:SetEyeAngles(Angle(0,-90,0))
            end
        end
    end
end

local function ToLLElev()
    local ents = ents.FindInBox( Vector(332.996979, 6573.930176, -2293.970703), Vector(431.461334, 6562.452148, -2293.970703))    
    for k, ply in pairs( ents ) do
        if ply:IsPlayer() then
            if not SpecialAccess(ply) then RejectTunns(ply) return end
            sound.Play("doors/handle_pushbar_open1.wav",ply:GetPos(),75,100,0.25)
            ply:SetPos(DarkRP.findEmptyPos(Vector(1762.911865, -3677.114502, -2293.967773), {ply}, 600, 10, Vector(16, 16, 64)))
            ply:SetVelocity(Vector(0,0,0))
            if ply:IsPlayer() then
                sound.Play("doors/handle_pushbar_locked1.wav",ply:GetPos(),75,100,0.5)
                ply:ChatPrint("You take the tunnel and arrive at The Lower Level Core Elevators.")
                ply:SetEyeAngles(Angle(0,90,0))
            end
        end
    end
end

local function CheckDonDoors()
    ToOffices()
    ToLobbyOne()
    ToLobbyTwo()
    ToLabs()
    ToLLTele()
    ToLLElev()
end

timer.Create( "DonatorDoorTriggers", 0.2, 0, CheckDonDoors )