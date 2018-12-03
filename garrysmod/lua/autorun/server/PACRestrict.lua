hook.Add("PrePACConfigApply", "allowed people only", function(ply, outfit_data)

    if  ply:IsUserGroup("user") or ply:IsUserGroup("VIP") then

        return false, "You need to be approved on the discord before you may use PAC!"
		
	else
	
		return true

    end

end)