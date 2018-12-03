function KillPlayer( victim, weapon, killer )
	victim:SetGravity(1)
end
hook.Add( "PlayerDeath", "OnPlayerDeath", KillPlayer )