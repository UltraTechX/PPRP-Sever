--[[---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua#L111

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomEntityFields

Add entities under the following line:
---------------------------------------------------------------------------]]
DarkRP.createEntity("Small Ammo Kit", { 
    ent = "cw_ammo_kit_small", 
    model = "models/Items/BoxSRounds.mdl", 
    price = 1000, 
    max = 3, 
    cmd = "buysmallammokit" 
}) 

DarkRP.createEntity("3D Sign", { 
    ent = "d3d_sign", 
    model = "models/props_trainstation/traincar_rack001.mdl", 
    price = 1000, 
    max = 3, 
    cmd = "buysign" 
}) 

DarkRP.createEntity("Ammo Kit", { 
    ent = "cw_ammo_kit_regular", 
    model = "models/Items/BoxMRounds.mdl", 
    price = 1500, 
    max = 3, 
    cmd = "buyammokit" 
}) 

DarkRP.createEntity("Small Ammo Crate", { 
    ent = "cw_ammo_crate_small", 
    model = "models/Items/item_item_crate.mdl", 
    price = 3000, 
    max = 3, 
    cmd = "buysmallammocrate" 
}) 

DarkRP.createEntity("Ammo Crate", { 
    ent = "cw_ammo_crate_regular", 
    model = "models/Items/ammocrate_smg1.mdl", 
    price = 4500, 
    max = 3, 
    cmd = "buyammocrate" 
}) 

DarkRP.createEntity("Small Metal Detector", { 
    ent = "ent_metal_detector_small", 
    model = "models/heracles421/metal_detector/metal_detector_small.mdl", 
    price = 5000, 
    max = 3, 
    cmd = "buysmalldetector",
	allowed = {TEAM_DIRECTOR,TEAM_HEADSECURITY,TEAM_SECURITY,TEAM_SECURITYMEDIC,TEAM_SECURITYTRAINEE,TEAM_CORESECURITY,TEAM_BLACKMARKET,TEAM_HEAVYWEAPONS,TEAM_LIGHTWEAPONS,TEAM_BUSINESSMAN,TEAM_HEADSWAT,TEAM_SWATSOLDIER,TEAM_SWATSNIPER,TEAM_SWATJUGGERNAUT,TEAM_SWATMEDIC,TEAM_SWATTRAINEE},
}) 

DarkRP.createEntity("Large Metal Detector", { 
    ent = "ent_metal_detector_large", 
    model = "models/heracles421/metal_detector/metal_detector_large.mdl", 
    price = 7500, 
    max = 3, 
    cmd = "buylargedetector",
	allowed = {TEAM_DIRECTOR,TEAM_HEADSECURITY,TEAM_SECURITY,TEAM_SECURITYMEDIC,TEAM_SECURITYTRAINEE,TEAM_CORESECURITY,TEAM_BLACKMARKET,TEAM_HEAVYWEAPONS,TEAM_LIGHTWEAPONS,TEAM_BUSINESSMAN,TEAM_HEADSWAT,TEAM_SWATSOLDIER,TEAM_SWATSNIPER,TEAM_SWATJUGGERNAUT,TEAM_SWATMEDIC,TEAM_SWATTRAINEE},
}) 

DarkRP.createEntity("Big Screen TV", { 
    ent = "mediaplayer_tv", 
    model = "models/gmod_tower/suitetv_large.mdl", 
    price = 4000, 
    max = 1, 
    cmd = "buybigscreentv" 
}) 

DarkRP.createEntity("gTerminal", { 
    ent = "sent_computer", 
    model = "models/props_lab/monitor01a.mdl", 
    price = 1000, 
    max = 1, 
	category = "gTerminal",
    cmd = "buygerminal" 
}) 

DarkRP.createEntity("Wire IO Device", { 
    ent = "sent_iodevice", 
    model = "models/props_lab/reciever01a.mdl", 
    price = 100, 
    max = 1, 
	category = "gTerminal",
    cmd = "buywireio" 
}) 

DarkRP.createEntity("Microphone", {
	ent = "rp_radio_microphone",
	model = "models/mic.mdl",
	price = 1000,
	max = 1,
	cmd = "buymic",
	category = "Radio",
})

DarkRP.createEntity("Radio", {
	ent = "rp_radio",
	model = "models/props_lab/citizenradio.mdl",
	price = 2000,
	max = 2,
	category = "Radio",
	cmd = "buyradio"
})



DarkRP.createEntity("Health Vial", {
	ent = "item_healthvial",
	model = "models/healthvial.mdl",
	price = 1000,
	max = 1,
	category = "Consumables",
	cmd = "buyhealth"
})

DarkRP.createEntity("Armor Cell", {
	ent = "item_battery",
	model = "models/items/battery.mdl",
	price = 2000,
	max = 1,
	category = "Consumables",
	cmd = "buyarmor"
})



DarkRP.createEntity("Bag", {
	ent = "fx_openbag",
	model = "models/oldbill/ahfoodbagopen.mdl",
	price = 100,
	max = 4,
	cmd = "fbbag",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})
DarkRP.createEntity("Bun Bottom", {
	ent = "fb_bunbottom",
	model = "models/oldbill/ahbunbottom.mdl",
	price = 100,
	max = 4,
	cmd = "fbbottom",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Bun Top", {
	ent = "fb_buntop",
	model = "models/oldbill/ahbuntop.mdl",
	price = 100,
	max = 4,
	cmd = "fbtop",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Burger Box", {
	ent = "fb_openburgerbox",
	model = "models/oldbill/ahburgerboxopen.mdl",
	price = 100,
	max = 4,
	cmd = "fbopenbox",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Burger", {
	ent = "fb_rawburger",
	model = "models/oldbill/ahrawburger.mdl",
	price = 100,
	max = 4,
	cmd = "fbburger",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Egriddle", {
	ent = "fb_egriddle",
	model = "models/oldbill/egriddle.mdl",
	price = 100,
	max = 1,
	cmd = "fb",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Fries", {
	ent = "ff_fries",
	model = "models/oldbill/ahfries.mdl",
	price = 100,
	max = 4,
	cmd = "fbfries",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Fry Basket", {
	ent = "ff_frybasket",
	model = "models/oldbill/ahfryerh.mdl",
	price = 100,
	max = 4,
	cmd = "fbfrybasket",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})
DarkRP.createEntity("Fryer", {
	ent = "ff_fryer",
	model = "models/oldbill/ahfryer.mdl",
	price = 100,
	max = 4,
	cmd = "fbfryer",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})
DarkRP.createEntity("Lettuce", {
	ent = "fb_lettuce",
	model = "models/oldbill/ahlettuce.mdl",
	price = 100,
	max = 4,
	cmd = "fblettuce",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Onion", {
	ent = "fb_onion",
	model = "models/oldbill/ahonion.mdl",
	price = 100,
	max = 4,
	cmd = "fbonion",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})
DarkRP.createEntity("Tomato", {
	ent = "fb_tomato",
	model = "models/oldbill/ahtomato.mdl",
	price = 100,
	max = 4,
	cmd = "fbtomato",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})
DarkRP.createEntity("Pizza", {
	ent = "fz_pizzaraw",
	model = "models/oldbill/ahpizzaraw.mdl",
	price = 100,
	max = 4,
	cmd = "fbpizza",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})
DarkRP.createEntity("Pizza Box", {
	ent = "fz_openpizzabox",
	model = "models/oldbill/ahpizzabox_open.mdl",
	price = 100,
	max = 4,
	cmd = "fbbox",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})
DarkRP.createEntity("Pizza Oven", {
	ent = "fz_pizzaoven",
	model = "models/oldbill/ahpizzaoven.mdl",
	price = 100,
	max = 2,
	cmd = "fbovenpizza",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})
DarkRP.createEntity("Soda Machine", {
	ent = "fs_sodamachine",
	model = "models/oldbill/ahsodamachine.mdl",
	price = 100,
	max = 1,
	cmd = "fbsodamachine",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})
DarkRP.createEntity("Straw", {
	ent = "fs_sodastraw",
	model = "models/oldbill/ahstraw.mdl",
	price = 100,
	max = 4,
	cmd = "fbstraw",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Soda Cup", {
	ent = "fs_sodacup",
	model = "models/oldbill/ahsodacup.mdl",
	price = 100,
	max = 4,
	cmd = "fbsodacup",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Soda Top", {
	ent = "fs_sodatop",
	model = "models/oldbill/ahsodacontainer.mdl",
	price = 100,
	max = 4,
	cmd = "fbsodatop",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 

})
DarkRP.createEntity("Tray", {
	ent = "fx_tray",
	model = "models/oldbill/ahtray.mdl",
	price = 100,
	max = 4,
	cmd = "fbtray",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
    category = "Fast Food", 
})

DarkRP.createEntity("FruitSlicer Shop", {
	ent = "zfs_shop",
	model = "models/zerochain/fruitslicerjob/fs_shop.mdl",
	price = 4000,
	max = 1,
	cmd = "buyzfs_shop",
	allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
	category = "FruitSlicer",
	sortOrder = 0
})

local Fruits = {}
Fruits["zfs_fruitbox_melon"] = "Melons"
Fruits["zfs_fruitbox_banana"] = "Bananas"
Fruits["zfs_fruitbox_coconut"] = "Coconuts"
Fruits["zfs_fruitbox_pomegranate"] = "Pomegranates"
Fruits["zfs_fruitbox_strawberry"] = "Strawberrys"
Fruits["zfs_fruitbox_kiwi"] = "Kiwis"
Fruits["zfs_fruitbox_lemon"] = "Lemons"
Fruits["zfs_fruitbox_orange"] = "Oranges"
Fruits["zfs_fruitbox_apple"] = "Apples"

for k, v in pairs(Fruits) do
	DarkRP.createEntity(v, {
		ent = k,
		model = "models/zerochain/fruitslicerjob/fs_cardboardbox.mdl",
		price = 1000,
		max = 5,
		cmd = "buy" .. k,
		allowed = {TEAM_CHEF,TEAM_TERRORISTCHEF},
		category = "FruitSlicer"
	})
end



DarkRP.createCategory{
	name = "Meth",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 103
}

DarkRP.createEntity("Combiner", {
	ent = "zmlab_combiner",
	model = "models/zerochain/zmlab/zmlab_combiner.mdl",
	price = 6000,
	max = 1,
	cmd = "buycombiner_zmlab",
	allowed = {TEAM_TERRORIST,TEAM_TERRORISTMEDIC,TEAM_TERRORISTJUGGERNAUT,TEAM_HEADTERRORIST,TEAM_TERRORISTTRAINEE,TEAM_TOURIST,TEAM_CORRUPTWORKER,TEAM_PROCORRUPTWORKER,TEAM_WORKER,TEAM_JANITOR,TEAM_CHEF,TEAM_TERRORISTCHEF,TEAM_BLACKMARKET,TEAM_HEAVYWEAPONS,TEAM_LIGHTWEAPONS,TEAM_BUSINESSMAN,TEAM_TERRORISTSNIPER},
	category = "Meth"
})

DarkRP.createEntity("Gas Filter", {
	ent = "zmlab_filter",
	model = "models/zerochain/zmlab/zmlab_filter.mdl",
	price = 1000,
	max = 1,
	cmd = "buyfilter_zmlab",
	allowed = {TEAM_TERRORIST,TEAM_TERRORISTMEDIC,TEAM_TERRORISTJUGGERNAUT,TEAM_HEADTERRORIST,TEAM_TERRORISTTRAINEE,TEAM_TOURIST,TEAM_CORRUPTWORKER,TEAM_PROCORRUPTWORKER,TEAM_WORKER,TEAM_JANITOR,TEAM_CHEF,TEAM_TERRORISTCHEF,TEAM_BLACKMARKET,TEAM_HEAVYWEAPONS,TEAM_LIGHTWEAPONS,TEAM_BUSINESSMAN,TEAM_TERRORISTSNIPER},
	category = "Meth"
})

DarkRP.createEntity("Frezzer", {
	ent = "zmlab_frezzer",
	model = "models/zerochain/zmlab/zmlab_frezzer.mdl",
	price = 2000,
	max = 2,
	cmd = "buyfrezzer_zmlab",
	allowed = {TEAM_TERRORIST,TEAM_TERRORISTMEDIC,TEAM_TERRORISTJUGGERNAUT,TEAM_HEADTERRORIST,TEAM_TERRORISTTRAINEE,TEAM_TOURIST,TEAM_CORRUPTWORKER,TEAM_PROCORRUPTWORKER,TEAM_WORKER,TEAM_JANITOR,TEAM_CHEF,TEAM_TERRORISTCHEF,TEAM_BLACKMARKET,TEAM_HEAVYWEAPONS,TEAM_LIGHTWEAPONS,TEAM_BUSINESSMAN,TEAM_TERRORISTSNIPER},
	category = "Meth"
})

DarkRP.createEntity("Transport Crate", {
	ent = "zmlab_collectcrate",
	model = "models/zerochain/zmlab/zmlab_transportcrate.mdl",
	price = 250,
	max = 5,
	cmd = "buycollectcrate_zmlab",
	allowed = {TEAM_TERRORIST,TEAM_TERRORISTMEDIC,TEAM_TERRORISTJUGGERNAUT,TEAM_HEADTERRORIST,TEAM_TERRORISTTRAINEE,TEAM_TOURIST,TEAM_CORRUPTWORKER,TEAM_PROCORRUPTWORKER,TEAM_WORKER,TEAM_JANITOR,TEAM_CHEF,TEAM_TERRORISTCHEF,TEAM_BLACKMARKET,TEAM_HEAVYWEAPONS,TEAM_LIGHTWEAPONS,TEAM_BUSINESSMAN,TEAM_TERRORISTSNIPER},
	category = "Meth"
})

DarkRP.createEntity("Methylamin", {
	ent = "zmlab_methylamin",
	model = "models/zerochain/zmlab/zmlab_methylamin.mdl",
	price = 1000,
	max = 6,
	cmd = "buymethylamin_zmlab",
	allowed = {TEAM_TERRORIST,TEAM_TERRORISTMEDIC,TEAM_TERRORISTJUGGERNAUT,TEAM_HEADTERRORIST,TEAM_TERRORISTTRAINEE,TEAM_TOURIST,TEAM_CORRUPTWORKER,TEAM_PROCORRUPTWORKER,TEAM_WORKER,TEAM_JANITOR,TEAM_CHEF,TEAM_TERRORISTCHEF,TEAM_BLACKMARKET,TEAM_HEAVYWEAPONS,TEAM_LIGHTWEAPONS,TEAM_BUSINESSMAN,TEAM_TERRORISTSNIPER},
	category = "Meth"
})

DarkRP.createEntity("Aluminium", {
	ent = "zmlab_aluminium",
	model = "models/zerochain/zmlab/zmlab_aluminiumbox.mdl",
	price = 100,
	max = 6,
	cmd = "buyaluminium_zmlab",
	allowed = {TEAM_TERRORIST,TEAM_TERRORISTMEDIC,TEAM_TERRORISTJUGGERNAUT,TEAM_HEADTERRORIST,TEAM_TERRORISTTRAINEE,TEAM_TOURIST,TEAM_CORRUPTWORKER,TEAM_PROCORRUPTWORKER,TEAM_WORKER,TEAM_JANITOR,TEAM_CHEF,TEAM_TERRORISTCHEF,TEAM_BLACKMARKET,TEAM_HEAVYWEAPONS,TEAM_LIGHTWEAPONS,TEAM_BUSINESSMAN,TEAM_TERRORISTSNIPER},
	category = "Meth"
})