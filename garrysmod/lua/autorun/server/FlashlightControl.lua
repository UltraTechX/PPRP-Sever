local rainbowTeams = {
	[TEAM_DIRECTOR] = true,
	[TEAM_HEADSECURITY] = true,
	[TEAM_SECURITY] = true,
	[TEAM_SECURITYMEDIC] = true,
	[TEAM_SECURITYTRAINEE] = true,
	[TEAM_HEADTERRORIST] = true,
	[TEAM_TERRORIST] = true,
	[TEAM_TERRORISTMEDIC] = true,
	[TEAM_TERRORISTJUGGERNAUT] = true,
	[TEAM_TERRORISTTRAINEE] = true,
	[TEAM_CORRUPTWORKER] = true,
	[TEAM_PROCORRUPTWORKER] = true,
	[TEAM_WORKER] = true,
	[TEAM_GUIDE] = true,
	[TEAM_HEADCBRN] = true,
	[TEAM_CBRNUNIT] = true,
	[TEAM_CBRNMEDIC] = true,
	[TEAM_CBRNSPECIAL] = true,
	[TEAM_HEADSWAT] = true,
	[TEAM_SWATSOLDIER] = true,
	[TEAM_SWATSNIPER] = true,
	[TEAM_SWATJUGGERNAUT] = true,
	[TEAM_SWATMEDIC] = true,
	[TEAM_SWATTRAINEE] = true,
	[TEAM_MANAGER] = true,
	[TEAM_CORESECURITY] = true,
	[TEAM_ADMIN] = true,
	[TEAM_TERRORISTSNIPER] = true,
	[TEAM_ACTIVITYCOORD] = true,
	[TEAM_ENGINEER] = true,
	[TEAM_SECURITYPERSONNEL] = true,
}

hook.Add("PlayerSwitchFlashlight", "StopFlashlightSpam", function(ply)
	if rainbowTeams[ply:Team()] then
		return true
	else
		return false
	end
end)