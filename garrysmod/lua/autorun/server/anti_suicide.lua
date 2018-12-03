function NoSuicide( ply )
    ply:PrintMessage( HUD_PRINTTALK, "Dont be a skrub and abuse this to get out of that fight/admin sit again. If you are legitimately stuck, ask an admin for help.")
    return false
end
hook.Add( "CanPlayerSuicide", "Suicide", NoSuicide )