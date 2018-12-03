--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]

TEAM_DIRECTOR = DarkRP.createJob("Plant Director", {
    color = Color(0, 151, 255, 255),
    model = {"models/player/female_02_suit.mdl","models/player/breen.mdl"},
    description = [[Second highest possible role in the plant, you control everyone and give them orders, you can organize events and help keep everyone in check.]],
    weapons = {"arrest_stick","unarrest_stick","stunstick","door_ram","cw_deagle","swep_radiodevice","weapon_cuff_tactical"},
    command = "DIRECTOR",
    max = 1,
    salary = 160,
    admin = 0,
    vote = true,
    hasLicense = true,
    candemote = true,
	category = "Executives",
    mayor = true,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
	PlayerDeath = function(ply, weapon, killer)
		ply:teamBan()
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
		if killer:IsPlayer() then
			DarkRP.notifyAll(0, 4, "The director has been killed and is therefor demoted.")
		else
			DarkRP.notifyAll(0, 4, "The director has died and is therefor demoted.")
		end
	end,
    customCheck = function(ply) return true end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 10,
})

TEAM_HEADSECURITY = DarkRP.createJob("Head of Security", {
    color = Color(0, 0, 200, 255),
    model = {"models/player/combine_soldier_prisonguard.mdl"},
    description = [[Highest possible role in the security branch, you control all security and give them orders, you can organize to keep everyone in check.]],
    weapons = {"arrest_stick","unarrest_stick","stunstick","door_ram","cw_smoke_grenade","cw_flash_grenade","fas2_m67","cw_deagle","cw_g36c","fas2_ifak","fas2_dv2","cw_shorty","swep_radiodevice","weapon_cuff_standard"},
    command = "HEADSECURITY",
    max = 1,
    salary = 150,
    admin = 0,
    vote = true,
    hasLicense = true,
    candemote = true,
	category = "Security",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 10,
})

TEAM_SECURITY = DarkRP.createJob("Security Officer", {
    color = Color(0, 0, 200, 255),
    model = {"models/player/combine_soldier.mdl"},
    description = [[Just your average security guard. You should take orders from higher ups!]],
    weapons = {"arrest_stick","unarrest_stick","stunstick","door_ram","cw_smoke_grenade","cw_flash_grenade","cw_p99","cw_mp5","fas2_ifak","fas2_dv2","cw_shorty","swep_radiodevice","weapon_cuff_standard"},
    command = "SECURITY",
    max = 3,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Security",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "You must be trained and whitelisted!",
	level = 8,
})

TEAM_SECURITYMEDIC = DarkRP.createJob("Security Medic", {
    color = Color(0, 0, 200, 255),
    model = {"models/player/combine_soldier.mdl"},
    description = [[Heal your fellow security guards!]],
    weapons = {"cw_p99","cw_mp5","fas2_ifak","fas2_dv2","swep_radiodevice","weapon_medkit","weapon_cuff_standard"},
    command = "SECURITYMEDIC",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Security",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "You must be trained and whitelisted!",
	level = 8,
})

TEAM_SECURITYTRAINEE = DarkRP.createJob("Security Trainee", {
    color = Color(0, 0, 200, 255),
    model = {"models/player/police.mdl","models/player/police_fem.mdl"},
    description = [[Train to be a security personnel!]],
    weapons = {"swep_radiodevice","weapon_cuff_standard","fas2_dv2"},
    command = "SECURITYTRAINEE",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Security",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
	level = 4,
})

TEAM_SECURITYPERSONNEL = DarkRP.createJob("Security Personnel", {
    color = Color(0, 0, 200, 255),
    model = {"models/player/police.mdl","models/player/police_fem.mdl"},
    description = [[Train to be a security officer!]],
    weapons = {"cw_p99","swep_radiodevice","weapon_cuff_standard","arrest_stick","unarrest_stick","stunstick","door_ram","cw_smoke_grenade","cw_flash_grenade","fas2_dv2","fas2_ifak"},
    command = "SECURITYPERSONNEL",
    max = 2,
    salary = 70,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Security",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
	level = 6,
})

TEAM_HEADTERRORIST = DarkRP.createJob("Osama Bin Laden", {
    color = Color(200, 0, 0, 255),
    model = {"models/code_gs/osama/osamaplayer.mdl"},
    description = [[Highest possible role in the Terrorist branch, you control all terrorists and give them orders to take over the plant, you can organize to keep everyone in check.]],
    weapons = {"cw_scarh","cw_mr96","fas2_machete","fas2_ifak","fas2_m67","cw_smoke_grenade","cw_flash_grenade","weapon_cuff_tactical","pro_lockpick","prokeypadcracker","zmlab_extractor","bkeycardscanner_procracker"},
    command = "HEADTERRORIST",
    max = 1,
    salary = 150,
    admin = 0,
    vote = true,
    hasLicense = true,
    candemote = true,
	category = "Terrorists",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 12,
})

TEAM_TERRORIST = DarkRP.createJob("Terrorist Grunt", {
    color = Color(200, 0, 0, 255),
    model = {"models/player/guerilla.mdl"},
    description = [[A simple terrorist under the rule of Osama Bin Laden!]],
    weapons = {"cw_l85a2","cw_shorty","cw_m1911","fas2_machete","fas2_ifak","cw_smoke_grenade","cw_flash_grenade","weapon_cuff_tactical","lockpick","keypad_cracker","zmlab_extractor","bkeycardscanner_cracker"},
    command = "TERRORIST",
    max = 6,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Terrorists",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "You must be trained and whitelisted!",
	level = 9,
})

TEAM_TERRORISTMEDIC = DarkRP.createJob("Terrorist Medic", {
    color = Color(200, 0, 0, 255),
    model = {"models/player/guerilla.mdl"},
    description = [[Heal your fellow grunts!]],
    weapons = {"cw_l85a2","cw_m1911","fas2_machete","fas2_ifak","weapon_medkit","weapon_cuff_tactical","lockpick","keypad_cracker","zmlab_extractor","bkeycardscanner_cracker"},
    command = "TERRORISTMEDIC",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Terrorists",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "You must be trained and whitelisted!",
	level = 9,
})

TEAM_TERRORISTTRAINEE = DarkRP.createJob("Terrorist Trainee", {
    color = Color(200, 0, 0, 255),
    model = {"models/player/leet.mdl"},
    description = [[Learn to praise allah!]],
    weapons = {"weapon_cuff_tactical","zmlab_extractor"},
    command = "TERRORISTTRAINEE",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Terrorists",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    CustomCheckFailMsg = "You must be trained and whitelisted!",
	level = 6,
})

TEAM_TOURIST = DarkRP.createJob("Visitor", {
    color = Color(20, 150, 20, 255),
    model = {"models/player/Group01/male_01.mdl","models/player/Group01/male_02.mdl","models/player/Group01/male_03.mdl","models/player/Group01/female_01.mdl","models/player/Group01/female_02.mdl","models/player/Group01/female_03.mdl"},
    description = [[Just taking a tour! Or so people think.]],
    weapons = {"zmlab_extractor"},
    command = "TOURIST",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Citizens",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
})

TEAM_CORRUPTWORKER = DarkRP.createJob("Corrupt Worker", {
    color = Color(100, 100, 100, 255),
    model = {"models/player/hostage/hostage_01.mdl","models/player/hostage/hostage_02.mdl","models/player/hostage/hostage_03.mdl","models/player/hostage/hostage_04.mdl"},
    description = [[This man will work for the highest bidder. Also takes hits.]],
    weapons = {"cw_fiveseven","fas2_machete","lockpick","keypad_cracker","zmlab_extractor","bkeycardscanner_cracker"},
    command = "CORRUPTWORKER",
    max = 3,
    salary = 70,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Plant Workers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
	level = 5,
})

TEAM_PROCORRUPTWORKER = DarkRP.createJob("Pro Corrupt Worker", {
    color = Color(100, 100, 100, 255),
    model = {"models/player/hostage/hostage_01.mdl","models/player/hostage/hostage_02.mdl","models/player/hostage/hostage_03.mdl","models/player/hostage/hostage_04.mdl"},
    description = [[This corrupt worker has been in the field for years and has some experience.]],
    weapons = {"cw_deagle","fas2_machete","fas2_ifak","pro_lockpick","prokeypadcracker","zmlab_extractor","bkeycardscanner_procracker"},
    command = "PROCORRUPTWORKER",
    max = 3,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Plant Workers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
	customCheck = function(ply) return ply:CheckGroup( "VIP" ) end,
    CustomCheckFailMsg = "This job is for VIP only!",
	level = 8,
})

TEAM_WORKER = DarkRP.createJob("Plant Worker", {
    color = Color(100, 100, 100, 255),
    model = {"models/player/hostage/hostage_01.mdl","models/player/hostage/hostage_02.mdl","models/player/hostage/hostage_03.mdl","models/player/hostage/hostage_04.mdl"},
    description = [[Just your normal plant worker. You should follow the orders of the higher ups!]],
    weapons = {"zmlab_extractor"},
    command = "WORKER",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Plant Workers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
	level = 1,
})

TEAM_JANITOR = DarkRP.createJob("Plant Janitor", {
    color = Color(100, 100, 100, 255),
    model = {"models/player/charple.mdl"},
    description = [[Roam around and clean the place!]],
    weapons = {"zmlab_extractor","broom"},
    command = "JANITOR",
    max = 3,
    salary = 70,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Plant Workers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    CustomCheckFailMsg = "This job is for VIP only!",
	level = 1,
})

TEAM_GUIDE = DarkRP.createJob("Tour Guide", {
    color = Color(100, 100, 100, 255),
    model = {"models/player/magnusson.mdl"},
    description = [[Show others the way around! You may not initiate in any combat!]],
    weapons = {},
    command = "GUIDE",
    max = 3,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Plant Workers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
	level = 5,
})

TEAM_HEADCBRN = DarkRP.createJob("Head of CBRN", {
    color = Color(255, 246, 94, 255),
    model = {"models/player/pmc_6/pmc__01.mdl","models/player/pmc_6/pmc__04.mdl"},
    description = [[Highest possible role in the CBRN branch, you control all CBRN and give them orders, you can organize to keep everyone in check.]],
    weapons = {"cw_smoke_grenade","fas2_m67","cw_flash_grenade","cw_deagle","fas2_ifak","fas2_dv2","weapon_zi_flamethrower","cw_g3a3","swep_radiodevice","weapon_cuff_tactical"},
    command = "HEADCBRN",
    max = 1,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
	category = "CBRN",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
})

TEAM_CBRNUNIT = DarkRP.createJob("CBRN Unit", {
    color = Color(255, 246, 94, 255),
    model = {"models/player/pmc_6/pmc__06.mdl","models/player/pmc_6/pmc__07.mdl"},
    description = [[Keep any biohazards in check. You should follow the orders of the higher ups!]],
    weapons = {"cw_smoke_grenade","cw_flash_grenade","cw_deagle","fas2_ifak","fas2_dv2","cw_g36c","swep_radiodevice","weapon_cuff_tactical"},
    command = "CBRNUNIT",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "CBRN",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
})

TEAM_CBRNMEDIC = DarkRP.createJob("CBRN Medic", {
    color = Color(255, 246, 94, 255),
    model = {"models/player/pmc_6/pmc__09.mdl","models/player/pmc_6/pmc__07.mdl"},
    description = [[Keep any biohazards in check. You should follow the orders of the higher ups!]],
    weapons = {"weapon_medkit","cw_deagle","fas2_ifak","fas2_dv2","cw_mp5","swep_radiodevice","weapon_cuff_tactical"},
    command = "CBRNMEDIC",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "CBRN",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
})

TEAM_CBRNSPECIAL = DarkRP.createJob("CBRN Specialist", {
    color = Color(255, 246, 94, 255),
    model = {"models/player/pmc_6/pmc__03.mdl","models/player/pmc_3/pmc__04.mdl"},
    description = [[Keep any biohazards in check. You should follow the orders of the higher ups!]],
    weapons = {"cw_smoke_grenade","cw_flash_grenade","cw_deagle","fas2_ifak","fas2_dv2","weapon_zi_flamethrower","swep_radiodevice","weapon_cuff_tactical"},
    command = "CBRNSPECIAL",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "CBRN",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
})

TEAM_HEADSWAT = DarkRP.createJob("Head of SWAT", {
    color = Color(0, 0, 255, 255),
    model = {"models/player/swat.mdl"},
    description = [[Highest possible role in the SWAT branch, you control all SWAT and give them orders, you can organize to keep everyone in check.]],
    weapons = {"arrest_stick","unarrest_stick","stunstick","door_ram","cw_smoke_grenade","cw_flash_grenade","fas2_m67","cw_m1911","cw_g36c","fas2_ifak","fas2_dv2","cw_m3super90","swep_radiodevice","weapon_cuff_tactical"},
    command = "HEADSWAT",
    max = 1,
    salary = 150,
    admin = 0,
    vote = true,
    hasLicense = true,
    candemote = true,
	category = "SWAT",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 12,
})

TEAM_SWATSOLDIER = DarkRP.createJob("SWAT Soldier", {
    color = Color(0, 0, 255, 255),
    model = {"models/player/urban.mdl"},
    description = [[Just an average SWAT soldier, you should take orders from higher ups!]],
    weapons = {"arrest_stick","unarrest_stick","stunstick","door_ram","cw_smoke_grenade","cw_flash_grenade","cw_m1911","cw_ump45","fas2_ifak","fas2_dv2","cw_shorty","swep_radiodevice","weapon_cuff_tactical"},
    command = "SWATSOLDIER",
    max = 3,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "SWAT",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 9,
})

TEAM_SWATSNIPER = DarkRP.createJob("SWAT Sniper", {
    color = Color(0, 0, 255, 255),
    model = {"models/player/urban.mdl"},
    description = [[Just an average SWAT soldier with a sniper, you should take orders from higher ups!]],
    weapons = {"arrest_stick","unarrest_stick","stunstick","door_ram","cw_smoke_grenade","cw_flash_grenade","cw_m1911","cw_l115","fas2_ifak","fas2_dv2","cw_shorty","swep_radiodevice","weapon_cuff_tactical"},
    command = "SWATSNIPER",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "SWAT",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 9,
})

TEAM_SWATMEDIC = DarkRP.createJob("SWAT Medic", {
    color = Color(0, 0, 255, 255),
    model = {"models/player/urban.mdl"},
    description = [[A SWAT soldier that focuses on healing! You should take orders from higher ups!]],
    weapons = {"weapon_medkit","cw_m1911","cw_mp5 ","fas2_ifak","fas2_dv2","swep_radiodevice","weapon_cuff_tactical"},
    command = "SWATMEDIC",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "SWAT",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 9,
})

TEAM_SWATTRAINEE = DarkRP.createJob("SWAT Trainee", {
    color = Color(0, 0, 255, 255),
    model = {"models/player/riot.mdl"},
    description = [[Train to be a SWAT Soldier!]],
    weapons = {"swep_radiodevice","weapon_cuff_tactical"},
    command = "SWATTRAINEE",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "SWAT",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    CustomCheckFailMsg = "This job is for VIP only!",
	level = 6,
})

TEAM_MANAGER = DarkRP.createJob("Manager", {
    color = Color(100, 100, 100, 255),
    model = {"models/player/magnusson.mdl"},
    description = [[Highest possible role in the Plant Worker branch, you control all Plant Workers and give them orders, you can organize to keep everyone in check.]],
    weapons = {"cw_deagle","fas2_ifak","fas2_dv2","swep_radiodevice","weapon_cuff_standard"},
    command = "MANAGER",
    max = 1,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
	category = "Plant Workers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 10,
})

TEAM_HEADRESEARCHER = DarkRP.createJob("Head Researcher", {
    color = Color(255, 255, 255, 255),
    model = {"models/player/eli.mdl"},
    description = [[Highest possible role in the Research branch, you control all Researchers and give them orders, you can organize to keep everyone in check.]],
    weapons = {"cw_deagle","fas2_ifak","fas2_dv2","swep_radiodevice","weapon_cuff_standard"},
    command = "HEADRESEARCHER",
    max = 1,
    salary = 150,
    admin = 0,
    vote = true,
    hasLicense = true,
    candemote = true,
	category = "Researchers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 10,
})

TEAM_RESEARCHER = DarkRP.createJob("Researcher", {
    color = Color(255, 255, 255, 255),
    model = {"models/player/kleiner.mdl"},
    description = [[Just an average researcher, experimenting on anomolous creatures. You should take orders from higher ups!]],
    weapons = {"swep_radiodevice"},
    command = "RESEARCHER",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Researchers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
    CustomCheckFailMsg = "You must be trained and whitelisted!",
	level = 6,
})

TEAM_RESEARCHERTRAINEE = DarkRP.createJob("Researcher Trainee", {
    color = Color(255, 255, 255, 255),
    model = {"models/player/mossman.mdl"},
    description = [[Train to become a reasearcher! You can only be trained by the head researcher.]],
    weapons = {"swep_radiodevice"},
    command = "RESEARCHERTRAINEE",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Researchers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
	level = 4,
})

TEAM_CHEF = DarkRP.createJob("Chef", {
    color = Color(238, 99, 99, 255),
    model = "models/fearless/chef1.mdl",
    description = [[Cook delicious food for the entire facility to enjoy!]],
    weapons = {"weapon_l4d2_frying_pan","zfs_knife"},
    command = "CHEF",
    max = 2,
    salary = 70,
    admin = 0,
    vote = false,
    hasLicense = false,
	category = "Plant Workers",
    cook = true,
	PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(25)
        ply:SetHealth(25)
        ply:SetArmor(0)
    end,
	level = 3,
    })
	
TEAM_TERRORISTCHEF = DarkRP.createJob("Terrorist Chef", {
    color = Color(238, 99, 99, 255),
    model = "models/player/leet.mdl",
    description = [[Food for the journey!]],
    weapons = {"weapon_l4d2_frying_pan","zmlab_extractor"},
    command = "TERRORISTCHEF",
    max = 2,
    salary = 70,
    admin = 0,
    vote = false,
    hasLicense = false,
	category = "Terrorists",
    cook = true,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted and player count must be equal to or above 16!",
	PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(25)
        ply:SetHealth(25)
        ply:SetArmor(0)
    end,
	level = 6,
    })

TEAM_SCPFIRE = DarkRP.createJob("457", {
    color = Color(0, 0, 0, 255),
    model = {"models/player/charple.mdl"},
    description = [[457 has a tendency to set everything around it on fire.]],
    weapons = {"weapon_scp457","weapon_physcannon","weapon_physgun","gmod_tool","keys"},
    command = "SCPFIRE",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	PlayerCanPickupWeapon = function(ply, weapon) return ( weapon:GetClass() == "weapon_scp457" or weapon:GetClass() == "weapon_physcannon" or weapon:GetClass() == "weapon_physgun" or weapon:GetClass() == "gmod_tool" or weapon:GetClass() == "keys" ) end,
	category = "Anomalous Creatures",
	PlayerLoadout = function(ply) return true end,
	customCheck = function(ply) return table.Count(player.GetAll()) >=8 end,
    CustomCheckFailMsg = "Player count must be equal to or above 8!",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(1000)
        ply:SetHealth(1000)
        ply:SetArmor(0)
    end,
	level = 7,
})

TEAM_SCPZOMBIE = DarkRP.createJob("049", {
    color = Color(0, 0, 0, 255),
    model = {"models/vinrax/player/scp049_player.mdl"},
    description = [[049 can create a zombie army, be careful.]],
    weapons = {"weapon_scp049","weapon_physcannon","weapon_physgun","gmod_tool","keys"},
    command = "SCPZOMBIE",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	PlayerLoadout = function(ply) return true end,
	category = "Anomalous Creatures",
	PlayerCanPickupWeapon = function(ply, weapon) return ( weapon:GetClass() == "weapon_scp049" or weapon:GetClass() == "weapon_physcannon" or weapon:GetClass() == "weapon_physgun" or weapon:GetClass() == "gmod_tool" or weapon:GetClass() == "keys" ) end,
	customCheck = function(ply) return table.Count(player.GetAll()) >=16 end,
    CustomCheckFailMsg = "This job is for VIP only! Player count must be equal to or above 16!",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(2500)
		GAMEMODE:SetPlayerSpeed(ply, GAMEMODE.Config.walkspeed * 0.9, GAMEMODE.Config.runspeed * 0.9)
        ply:SetHealth(2500)
        ply:SetArmor(0)
    end,
	level = 7,
})

TEAM_SCPZOMBIESLAVE = DarkRP.createJob("049-2", {
    color = Color(0, 0, 0, 255),
    model = {"models/player/zombie_classic.mdl"},
    description = [[049's zombie army.]],
    weapons = {"weapon_sillyzombieclaw_v2"},
    command = "SCPZOMBIESLAVE",
    max = 0,
    salary = 100,
    admin = 1,
    vote = false,
    hasLicense = false,
    candemote = false,
	PlayerLoadout = function(ply) return true end,
	category = "Anomalous Creatures",
    mayor = false,
	PlayerCanPickupWeapon = function(ply, weapon) return ( weapon:GetClass() == "weapon_sillyzombieclaw_v2" or weapon:GetClass() == "weapon_physcannon" or weapon:GetClass() == "weapon_physgun" or weapon:GetClass() == "gmod_tool" or weapon:GetClass() == "keys" ) end,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(250)
        ply:SetHealth(250)
        ply:SetArmor(0)
    end,
})

TEAM_SCPRAVEN = DarkRP.createJob("3431", {
    color = Color(0, 0, 0, 255),
    model = {"models/player/ravenwarriorplayer.mdl"},
    description = [[A very aggressive bird.]],
    weapons = {"eoti_raven_swep","weapon_physcannon","weapon_physgun","gmod_tool","keys"},
    command = "SCPRAVEN",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
	PlayerLoadout = function(ply) return true end,
	category = "Anomalous Creatures",
	PlayerCanPickupWeapon = function(ply, weapon) return ( weapon:GetClass() == "eoti_raven_swep" or weapon:GetClass() == "weapon_physcannon" or weapon:GetClass() == "weapon_physgun" or weapon:GetClass() == "gmod_tool" or weapon:GetClass() == "keys" ) end,
	customCheck = function(ply) return table.Count(player.GetAll()) >=8 end,
    CustomCheckFailMsg = "Player count must be equal to or above 8!",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(600)
        ply:SetHealth(600)
        ply:SetArmor(0)
    end,
	level = 7,
})

TEAM_SCPHEADCRAB = DarkRP.createJob("Sand Nigerian", {
    color = Color(0, 0, 0, 255),
    model = {"models/player/headcrab.mdl"},
    description = [[Build a village to greet the facility personnel coming to his home land from a mysterious portal.]],
    weapons = {"weapon_crowbar"},
    command = "SCPHEADCRAB",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Anomalous Creatures",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
	level = 2,
})

TEAM_CORESECURITY = DarkRP.createJob("Core Room Security", {
    color = Color(0, 0, 200, 255),
    model = {"models/player/combine_soldier.mdl"},
    description = [[Protect the core room at all costs!]],
    weapons = {"cw_smoke_grenade","cw_flash_grenade","cw_deagle","cw_g36c","fas2_ifak","fas2_dv2","cw_shorty","swep_radiodevice","weapon_cuff_tactical"},
    command = "CORESECURITY",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
	category = "Security",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(200)
        ply:SetHealth(200)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "You must be trained and whitelisted!",
	level = 7,
})

TEAM_BLACKMARKET = DarkRP.createJob("Black Market Dealer", {
    color = Color(49, 86, 145, 255),
    model = {"models/player/eli.mdl"},
    description = [[Sells items from the black market.]],
    weapons = {"cw_deagle","zmlab_extractor"},
    command = "BLACKMARKET",
    max = 3,
    salary = 70,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Shop Owners",
    mayor = false,
    customCheck = function(ply) return ply:CheckGroup( "VIP" ) end,
    CustomCheckFailMsg = "This job is for VIP only!",
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
	level = 3,
})

TEAM_HEAVYWEAPONS = DarkRP.createJob("Heavy Weapons Dealer", {
    color = Color(49, 86, 145, 255),
    model = {"models/player/monk.mdl"},
    description = [[Sells heavy weapons.]],
    weapons = {"cw_deagle","zmlab_extractor"},
    command = "HEAVYWEAPONS",
    max = 3,
    salary = 70,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Shop Owners",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
	level = 3,
})


TEAM_LIGHTWEAPONS = DarkRP.createJob("Light Weapons Dealer", {
    color = Color(49, 86, 145, 255),
    model = {"models/player/barney.mdl"},
    description = [[Sells light weapons.]],
    weapons = {"cw_deagle","zmlab_extractor"},
    command = "LIGHTWEAPONS",
    max = 3,
    salary = 70,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Shop Owners",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
	level = 3,
})

TEAM_BUSINESSMAN = DarkRP.createJob("Businessman", {
    color = Color(49, 86, 145, 255),
    model = {"models/player/gman_high.mdl"},
    description = [[Try to make deals and sell things to make profit.]],
    weapons = {"cw_deagle","zmlab_extractor"},
    command = "BUSINESSMAN",
    max = 0,
    salary = 70,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Shop Owners",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
	level = 1,
})

TEAM_ADMIN = DarkRP.createJob("Admin on Duty", {
    color = Color(170, 0, 0, 255),
    model = {"models/fearless/mayor1.mdl"},
    description = [[Keep the server in check!]],
    weapons = {"realrbn_tazer_mr","staff_lockpick","prokeypadcracker","bkeycardscanner_procracker"},
    command = "AOD",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
	category = "Citizens",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(99999999)
        ply:SetHealth(99999999)
        ply:SetArmor(100)
    end,
    bWhitelist_customCheck = function(ply) return ply:CheckGroup( "TrialModerator" ) end,
    CustomCheckFailMsg = "This job is for Admins only!",
})

TEAM_TERRORISTSNIPER = DarkRP.createJob("Terrorist Sniper", {
    color = Color(200, 0, 0, 255),
    model = {"models/player/guerilla.mdl"},
    description = [[A terrorist with a sniper! Kill everyone that tries to harm your brothers.]],
	weapons = {"cw_l115","cw_shorty","cw_m1911","fas2_machete","fas2_ifak","cw_smoke_grenade","cw_flash_grenade","weapon_cuff_tactical","lockpick","keypad_cracker","zmlab_extractor","bkeycardscanner_cracker"},
    command = "TERRORISTSNIPER",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "Terrorists",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 9,
})

TEAM_ACTIVITYCOORD = DarkRP.createJob("Activity Coordinator", {
    color = Color(100, 100, 100, 255),
    model = {"models/player/Group03m/female_06.mdl"},
    description = [[Force everyone to do team building activities! Work with other coordinators to make fun activites!]],
	weapons = {"zmlab_extractor"},
    command = "ACTIVITYCOORD",
    max = 3,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Plant Workers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 3,
})

TEAM_ENGINEER = DarkRP.createJob("Engineer", {
    color = Color(100, 100, 100, 255),
    model = {"models/player/mechanic.mdl"},
    description = [[Diagnose problems with machines around the facility and fix them!]],
	weapons = {"weapon_hlof_pipewrench"},
    command = "ENGINEER",
    max = 3,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Plant Workers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
	level = 4,
})

TEAM_INSPECTOR = DarkRP.createJob("Inspector", {
    color = Color(100, 100, 100, 255),
    model = {"models/models/konnie/engineer/engineer.mdl"},
    description = [[Inspect the plant to fine them for problems and threaten to close them down if they don't pay!]],
	weapons = {},
    command = "INSPECTOR",
    max = 3,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Plant Workers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
	level = 2,
})

TEAM_OWNER = DarkRP.createJob("Plant Owner", {
    color = Color(0, 151, 255, 255),
    model = {"models/player/breen.mdl","models/player/female_02_suit.mdl"},
    description = [[Highest possible role in the plant, you control everyone and give them orders, you can organize events and help keep everyone in check. You may also mentor the director and take over if necessary.]],
    weapons = {"arrest_stick","unarrest_stick","stunstick","door_ram","cw_deagle","swep_radiodevice","weapon_cuff_tactical"},
    command = "OWNER",
    max = 1,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = true,
	category = "Executives",
    mayor = true,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
	PlayerDeath = function(ply, weapon, killer)
		ply:teamBan()
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
		if killer:IsPlayer() then
			DarkRP.notifyAll(0, 4, "The owner has been killed and is therefor demoted.")
		else
			DarkRP.notifyAll(0, 4, "The owner has died and is therefor demoted.")
		end
	end,
    customCheck = function(ply) return ply:CheckGroup( "VIP" ) end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
	level = 15,
})

TEAM_CBRNHEAVY = DarkRP.createJob("CBRN Heavy Unit", {
    color = Color(255, 246, 94, 255),
    model = {"models/player/pmc_6/pmc__14.mdl","models/player/pmc_6/pmc__13.mdl","models/player/pmc_6/pmc__07.mdl"},
    description = [[Keep any biohazards in check. You should follow the orders of the higher ups!]],
    weapons = {"cw_smoke_grenade","cw_flash_grenade","cw_deagle","fas2_ifak","fas2_dv2","cw_g36c","swep_radiodevice","weapon_cuff_tactical"},
    command = "CBRNHEAVY",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "CBRN",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
})

TEAM_CBRNRECON = DarkRP.createJob("CBRN Recon Unit", {
    color = Color(255, 246, 94, 255),
    model = {"models/player/pmc_6/pmc__10.mdl","models/player/pmc_6/pmc__07.mdl"},
    description = [[Keep any biohazards in check. You should follow the orders of the higher ups!]],
    weapons = {"cw_smoke_grenade","cw_flash_grenade","cw_deagle","fas2_ifak","fas2_dv2","cw_g36c","swep_radiodevice","weapon_cuff_tactical"},
    command = "CBRNRECON",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
	category = "CBRN",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end,
    CustomCheckFailMsg = "This job is for VIP only! You must also be trained and whitelisted!",
})

TEAM_TESTSUBJECT = DarkRP.createJob("Test Subject", {
    color = Color(255, 255, 255, 255),
    model = {"models/player/aperture_science/male_01.mdl","models/player/aperture_science/male_02.mdl","models/player/aperture_science/male_03.mdl","models/player/aperture_science/male_04.mdl","models/player/aperture_science/male_05.mdl","models/player/aperture_science/male_06.mdl","models/player/aperture_science/male_07.mdl","models/player/aperture_science/male_08.mdl","models/player/aperture_science/male_09.mdl"},
    description = [[Get tested on by researchers!]],
    weapons = {"weapon_fists"},
    command = "TESTSUBJECT",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
	category = "Researchers",
    mayor = false,
    PlayerSpawn = function(ply)
		
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(0)
    end,
	level = 2,
})

--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_TOURIST
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [TEAM_DIRECTOR] = true, 
	[TEAM_OWNER] = true, 
	[TEAM_HEADSWAT] = true,
	[TEAM_HEADSECURITY] = true,
	[TEAM_SECURITY] = true,
	[TEAM_SECURITYMEDIC] = true,
	[TEAM_SECURITYPERSONNEL] = true,
	[TEAM_CORESECURITY] = true,
	[TEAM_SWATSOLDIER] = true,
	[TEAM_SWATSNIPER] = true,
	[TEAM_SWATMEDIC] = true,
	[TEAM_ADMIN] = true,
}
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]