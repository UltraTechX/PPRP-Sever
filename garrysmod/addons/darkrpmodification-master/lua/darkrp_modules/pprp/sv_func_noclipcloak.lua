hook.Add( "PlayerNoClip", "isInNoClip", function( ply, desiredNoClipState )
	local NoclipCloakAntispam = 0
	if ply:CheckGroup( "TrialModerator" ) then
		if NoclipCloakAntispam == 0 then
			if ply:GetMoveType() == MOVETYPE_NOCLIP then
				if(ply:SteamID() == "STEAM_0:1:218173703") then
					DarkRP.notify(ply, 5, 1, "Noclip/Cloak/Godmode Disabled")
				end
				RunConsoleCommand( "fadmin", "uncloak", ply:SteamID())
				ply:GodDisable()
				NoclipCloakAntispam = 1
				timer.Simple(0.2,function()
					NoclipCloakAntispam = 0
				end)
			else
				if(ply:SteamID() == "STEAM_0:1:218173703") then
					DarkRP.notify(ply, 5, 1, "Noclip/Cloak/Godmode Enabled")
				end
				RunConsoleCommand( "fadmin", "cloak", ply:SteamID())
				ply:GodEnable()
				timer.Simple(0.2,function()
					NoclipCloakAntispam = 0
				end)
			end
		end
	end
end )	