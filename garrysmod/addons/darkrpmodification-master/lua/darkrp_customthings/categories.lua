--[[-----------------------------------------------------------------------
Categories
---------------------------------------------------------------------------
The categories of the default F4 menu.

Please read this page for more information:
http://wiki.darkrp.com/index.php/DarkRP:Categories

In case that page can't be reached, here's an example with explanation:

DarkRP.createCategory{
    name = "Citizens", -- The name of the category.
    categorises = "jobs", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(0, 107, 0, 255), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 100, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}


Add new categories under the next line!
---------------------------------------------------------------------------]]

DarkRP.createCategory{
    name = "Executives",
    categorises = "jobs",
    startExpanded = false,
    color = Color(55, 55, 55, 255),
    canSee = function(ply) return true end,
    sortOrder = 1
}

DarkRP.createCategory{
    name = "Security",
    categorises = "jobs",
    startExpanded = false,
    color = Color(0, 0, 200, 255),
    canSee = function(ply) return true end,
    sortOrder = 4
}

DarkRP.createCategory{
    name = "Terrorists",
    categorises = "jobs",
    startExpanded = false,
    color = Color(155, 0, 0, 255),
    canSee = function(ply) return true end,
    sortOrder = 3
}

DarkRP.createCategory{
    name = "SWAT",
    categorises = "jobs",
    startExpanded = false,
    color = Color(0, 0, 255, 255),
    canSee = function(ply) return true end,
    sortOrder = 2
}

DarkRP.createCategory{
    name = "Plant Workers",
    categorises = "jobs",
    startExpanded = false,
    color = Color(100, 100, 100, 255),
    canSee = function(ply) return true end,
    sortOrder = 5
}

DarkRP.createCategory{
    name = "CBRN",
    categorises = "jobs",
    startExpanded = false,
    color = Color(255, 246, 94, 255),
    canSee = function(ply) return true end,
    sortOrder = 6
}

DarkRP.createCategory{
    name = "Researchers",
    categorises = "jobs",
    startExpanded = false,
    color = Color(255, 255, 255, 255),
    canSee = function(ply) return true end,
    sortOrder = 7
}

DarkRP.createCategory{
    name = "Shop Owners",
    categorises = "jobs",
    startExpanded = false,
    color = Color(49, 86, 145, 255),
    canSee = function(ply) return true end,
    sortOrder = 8
}

DarkRP.createCategory{
    name = "Anomalous Creatures",
    categorises = "jobs",
    startExpanded = false,
    color = Color(0, 0, 0, 255),
    canSee = function(ply) return true end,
    sortOrder = 9
}



DarkRP.createCategory{
    name = "Radio",
    categorises = "entities",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    sortOrder = 2
}

DarkRP.createCategory{
    name = "Consumables",
    categorises = "entities",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    sortOrder = 1
}



DarkRP.createCategory{
    name = "Black Market",
    categorises = "shipments",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    canSee = function(ply) return table.HasValue({TEAM_BLACKMARKET}, ply:Team()) end,
    sortOrder = 3
}

DarkRP.createCategory{
    name = "Heavy Weapons",
    categorises = "shipments",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    canSee = function(ply) return table.HasValue({TEAM_HEAVYWEAPONS}, ply:Team()) end,
    sortOrder = 1
}

DarkRP.createCategory{
    name = "Light Weapons",
    categorises = "shipments",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    canSee = function(ply) return table.HasValue({TEAM_LIGHTWEAPONS}, ply:Team()) end,
    sortOrder = 2
}

DarkRP.createCategory{
    name = "Black Market",
    categorises = "weapons",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    canSee = function(ply) return table.HasValue({TEAM_BLACKMARKET}, ply:Team()) end,
    sortOrder = 3
}

DarkRP.createCategory{
    name = "Heavy Weapons",
    categorises = "weapons",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    canSee = function(ply) return table.HasValue({TEAM_HEAVYWEAPONS}, ply:Team()) end,
    sortOrder = 1
}

DarkRP.createCategory{
    name = "Light Weapons",
    categorises = "weapons",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    canSee = function(ply) return table.HasValue({TEAM_LIGHTWEAPONS}, ply:Team()) end,
    sortOrder = 2
}

DarkRP.createCategory{
    name = "Fast Food",
    categorises = "entities",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    sortOrder = 3
}

DarkRP.createCategory{
    name = "gTerminal",
    categorises = "entities",
    startExpanded = true,
    color = Color(0, 0, 0, 255),
    sortOrder = 2
}