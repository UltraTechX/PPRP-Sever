local playercount = 0

gameevent.Listen( "player_connect" )
hook.Add( "player_connect", "connect+1", function( data )
    playercount = playercount + 1
end)

gameevent.Listen( "player_disconnect" )
hook.Add("player_disconnect", "disconnect+1", function(data)
    playercount = playercount - 1
end)

function playercountcon()
    return playercount
end