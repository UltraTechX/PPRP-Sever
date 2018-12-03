lastP = 0

local function CheckCleanup()
	if #player.GetHumans() <= 0 and lastP > 0 then
		RunConsoleCommand("gmod_admin_cleanup")
	end
	lastP = #player.GetHumans()
end

local function CheckCleanupTwo()
	if #player.GetHumans() <= 0 and lastP <= 0 then
		RunConsoleCommand("gmod_admin_cleanup")
	end
	lastP = #player.GetHumans()
end

local function CheckCleanupDecal()
	RunConsoleCommand("r_cleardecals")
end

local function CreateTimer()
	timer.Create( "OPI_CLEANUP_CHECK_1", 60, 0, function() CheckCleanup() end )
	timer.Create( "OPI_CLEANUP_CHECK_2", 900, 0, function() CheckCleanupTwo() end )
	--timer.Create( "OPI_DECAL", 60, 0, function() CheckCleanupDecal() end )
end

hook.Add( "Initialize", "OPI_CLEANUP_TIMER", CreateTimer )