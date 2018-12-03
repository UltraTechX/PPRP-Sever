local JobsAllowed = {TEAM_HEADTERRORIST, TEAM_TERRORIST, TEAM_TERRORISTMEDIC, TEAM_SNIPER, TEAM_CHEF}

local function spawn( ply )
	print(0)
	if table.HasValue(JobsAllowed, ply:Team()) then
		print(1)
		if(ply:CheckGroup( "VIP" )) then
			print(2)
			ply:Give("swep_disguise_briefcase")
		else
			print(3)
			if( math.random (1, 10) < 1 ) then
				print(4)
				ply:Give("swep_disguise_briefcase")
			end
		end
	end
end
hook.Add( "PlayerSpawn", "OpiRandomDisguise", spawn )