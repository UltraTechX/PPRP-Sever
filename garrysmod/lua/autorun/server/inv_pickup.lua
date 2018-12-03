function Custom_Loadout( ply )

		ply:Give("itemstore_pickup") --Gives the player weapon weapon_shotgun
 
end
 hook.Add( "PlayerLoadout", "OpiItemstoreCustomGamemodeLoadoutFunction", Custom_Loadout)