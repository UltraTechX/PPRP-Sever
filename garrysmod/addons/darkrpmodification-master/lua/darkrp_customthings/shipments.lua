--[[---------------------------------------------------------------------------
DarkRP custom shipments and guns
---------------------------------------------------------------------------

This file contains your custom shipments and guns.
This file should also contain shipments and guns from DarkRP that you edited.

Note: If you want to edit a default DarkRP shipment, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the shipment to this file and edit it.

The default shipments and guns can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomShipmentFields


Add shipments and guns under the following line:
---------------------------------------------------------------------------]]
--[[-----------------

Job Name - Category Name

TEAM_HEAVYWEAPONS - Heavy Weapons
TEAM_LIGHTWEAPONS - Light Weapons
TEAM_BLACKMARKET - Black Market

-----------]]

DarkRP.createShipment("Medkit", {
    model = "models/Items/HealthKit.mdl",
    entity = "fas2_ifak",
    amount = 10,
    price = 36000,
    separate = true,
    pricesep = 5000,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Frag Grenade", {
    model = "models/weapons/w_eq_fraggrenade_thrown.mdl",
    entity = "fas2_m67",
    amount = 10,
    price = 25000,
    separate = true,
    pricesep = 3600,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Smoke Grenade", {
    model = "models/weapons/w_eq_smokegrenade.mdl",
    entity = "cw_smoke_grenade",
    amount = 10,
    price = 20000,
    separate = true,
    pricesep = 3000,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Flash Grenade", {
    model = "models/weapons/w_eq_flashbang.mdl",
    entity = "cw_flash_grenade",
    amount = 10,
    price = 20000,
    separate = true,
    pricesep = 3000,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("SLAM", {
    model = "models/weapons/w_slam.mdl",
    entity = "weapon_slam",
    amount = 10,
    price = 36000,
    separate = true,
    pricesep = 4500,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Crowbar", {
    model = "models/weapons/w_crowbar.mdl",
    entity = "weapon_crowbar",
    amount = 10,
    price = 16000,
    separate = true,
    pricesep = 2500,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Lockpick", {
    model = "models/weapons/w_crowbar.mdl",
    entity = "lockpick",
    amount = 10,
    price = 18000,
    separate = true,
    pricesep = 2500,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Breaching Charge", {
    model = "models/weapons/w_slam.mdl",
    entity = "breachingcharge",
    amount = 10,
    price = 32500,
    separate = true,
    pricesep = 4000,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Keypad Cracker", {
    model = "models/weapons/w_c4.mdl",
    entity = "keypad_cracker",
    amount = 10,
    price = 20000,
    separate = true,
    pricesep = 2750,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Riot Shield", {
    model = "models/drover/w_shield.mdl",
    entity = "weapon_policeshield",
    amount = 10,
    price = 55000,
    separate = true,
    pricesep = 7000,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Wire Laser Pointer", {
    model = "models/weapons/w_357.mdl",
    entity = "laserpointer",
    amount = 10,
    price = 2500,
    separate = true,
    pricesep = 250,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Basic Handcuffs", {
    model = "models/weapons/w_toolgun.mdl",
    entity = "weapon_cuff_standard",
    amount = 10,
    price = 6500,
    separate = true,
    pricesep = 720,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Elastic Restraint", {
    model = "models/weapons/w_toolgun.mdl",
    entity = "weapon_cuff_elastic",
    amount = 10,
    price = 7500,
    separate = true,
    pricesep = 1000,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Tactical Restraint", {
    model = "models/weapons/w_toolgun.mdl",
    entity = "weapon_cuff_tactical",
    amount = 10,
    price = 20000,
    separate = true,
    pricesep = 2500,
    noship = false,
    category = "Black Market",
    allowed = {TEAM_BLACKMARKET},
    customCheck = function(ply) return
        table.HasValue({TEAM_BLACKMARKET}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})





DarkRP.createShipment("PM", {
    model = "models/cw2/pistols/w_makarov.mdl",
    entity = "cw_makarov",
    amount = 10,
    price = 9000,
    separate = true,
    pricesep = 1250,
    noship = false,
    category = "Light Weapons",
    allowed = {TEAM_LIGHTWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_LIGHTWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("PM99", {
    model = "models/weapons/w_pist_p228.mdl",
    entity = "cw_p99",
    amount = 10,
    price = 16000,
    separate = true,
    pricesep = 2000,
    noship = false,
    category = "Light Weapons",
    allowed = {TEAM_LIGHTWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_LIGHTWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("MR96", {
    model = "models/weapons/w_357.mdl",
    entity = "cw_mr96",
    amount = 10,
    price = 36000,
    separate = true,
    pricesep = 4000,
    noship = false,
    category = "Light Weapons",
    allowed = {TEAM_LIGHTWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_LIGHTWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("MAC-11", {
    model = "models/weapons/w_cst_mac11.mdl",
    entity = "cw_mac11",
    amount = 10,
    price = 45000,
    separate = true,
    pricesep = 5000,
    noship = false,
    category = "Light Weapons",
    allowed = {TEAM_LIGHTWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_LIGHTWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("M1911", {
    model = "models/weapons/cw_pist_m1911.mdl",
    entity = "cw_m1911",
    amount = 10,
    price = 21000,
    separate = true,
    pricesep = 2500,
    noship = false,
    category = "Light Weapons",
    allowed = {TEAM_LIGHTWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_LIGHTWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Desert Eagle", {
    model = "models/weapons/w_pist_deagle.mdl",
    entity = "cw_deagle",
    amount = 10,
    price = 38000,
    separate = true,
    pricesep = 4200,
    noship = false,
    category = "Light Weapons",
    allowed = {TEAM_LIGHTWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_LIGHTWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("Five-seveN", {
    model = "models/weapons/w_pist_fiveseven.mdl",
    entity = "cw_fiveseven",
    amount = 10,
    price = 20000,
    separate = true,
    pricesep = 2400,
    noship = false,
    category = "Light Weapons",
    allowed = {TEAM_LIGHTWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_LIGHTWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})






DarkRP.createShipment("Serbu Shorty", {
    model = "models/weapons/cw2_super_shorty.mdl",
    entity = "cw_shorty",
    amount = 10,
    price = 67500,
    separate = true,
    pricesep = 7500,
    noship = false,
    category = "Heavy Weapons",
    allowed = {TEAM_HEAVYWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_HEAVYWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("M14 EBR", {
    model = "models/weapons/w_cstm_m14.mdl",
    entity = "cw_m14",
    amount = 10,
    price = 110000,
    separate = true,
    pricesep = 12500,
    noship = false,
    category = "Heavy Weapons",
    allowed = {TEAM_HEAVYWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_HEAVYWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("L115", {
    model = "models/weapons/w_cstm_l96.mdl",
    entity = "cw_l115",
    amount = 10,
    price = 205000,
    separate = true,
    pricesep = 22500,
    noship = false,
    category = "Heavy Weapons",
    allowed = {TEAM_HEAVYWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_HEAVYWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("MP5", {
    model = "models/weapons/w_smg_mp5.mdl",
    entity = "cw_mp5",
    amount = 10,
    price = 70000,
    separate = true,
    pricesep = 8000,
    noship = false,
    category = "Heavy Weapons",
    allowed = {TEAM_HEAVYWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_HEAVYWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})


DarkRP.createShipment("UMP .45", {
    model = "models/weapons/w_smg_ump45.mdl",
    entity = "cw_ump45",
    amount = 10,
    price = 120000,
    separate = true,
    pricesep = 13500,
    noship = false,
    category = "Heavy Weapons",
    allowed = {TEAM_HEAVYWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_HEAVYWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("G36C", {
    model = "models/weapons/cw20_g36c.mdl",
    entity = "cw_g36c",
    amount = 10,
    price = 135000,
    separate = true,
    pricesep = 15000,
    noship = false,
    category = "Heavy Weapons",
    allowed = {TEAM_HEAVYWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_HEAVYWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})

DarkRP.createShipment("AK-74", {
    model = "models/weapons/w_rif_ak47.mdl",
    entity = "cw_ak74",
    amount = 10,
    price = 128000,
    separate = true,
    pricesep = 14000,
    noship = false,
    category = "Heavy Weapons",
    allowed = {TEAM_HEAVYWEAPONS},
    customCheck = function(ply) return
        table.HasValue({TEAM_HEAVYWEAPONS}, ply:Team())
    end,
    CustomCheckFailMsg = "You are not the right job!",
})
