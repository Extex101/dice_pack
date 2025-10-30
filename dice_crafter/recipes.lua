
local iron = xcompat.materials.steel_ingot
local gold = xcompat.materials.gold_ingot
local wood = "group:wood"
local paper = xcompat.materials.paper
local clay = xcompat.materials.clay_lump
local black = xcompat.materials.dye_black

core.register_craft({
    output = "dice_crafter:crafter",
    recipe = {
        {iron, iron, iron},
        {wood, gold, wood},
        {wood, wood, wood},
    }
})


core.register_craft({
    output = "dice_crafter:template_coin",
    recipe = {
        {black, iron, black},
        {iron, iron, iron},
        {black, iron, black}
    }
})

-- ________D4 Crafting________ --

-- core.register_craft({
--     output = "dice_crafter:template_d4",
--     recipe = {
--         {black, paper, black},
--         {paper, clay, paper},
--         {black, paper, black}
--     }
-- })

-- ________D6 Crafting________ --

-- core.register_craft({
--     type = "shapeless",
--     output = "dice_crafter:template_d6",
--     recipe = {"dice_crafter:template_d4", paper}
-- })

-- Remove once d4 is added
core.register_craft({
    output = "dice_crafter:template_d6",
    recipe = {
        {black, paper, black},
        {paper, clay, paper},
        {black, paper, black}
    }
})

-- ________D8 Crafting________ --

-- core.register_craft({
--     type = "shapeless",
--     output = "dice_crafter:template_d8",
--     recipe = {"dice_crafter:template_d4", paper, paper}
-- })

-- core.register_craft({
--     type = "shapeless",
--     output = "dice_crafter:template_d8",
--     recipe = {"dice_crafter:template_d6", paper}
-- })


-- ________D12 Crafting________ --

-- core.register_craft({
--     type = "shapeless",
--     output = "dice_crafter:template_d12",
--     recipe = {"dice_crafter:template_d4", paper, paper, paper}
-- })

core.register_craft({
    type = "shapeless",
    output = "dice_crafter:template_d12",
    recipe = {"dice_crafter:template_d6", paper, paper}
})

-- core.register_craft({
--     type = "shapeless",
--     output = "dice_crafter:template_d12",
--     recipe = {"dice_crafter:template_d8", paper}
-- })


-- ________D20 Crafting________ --

-- core.register_craft({
--     type = "shapeless",
--     output = "dice_crafter:template_d20",
--     recipe = {"dice_crafter:template_d4", paper, paper, paper, paper}
-- })

core.register_craft({
    type = "shapeless",
    output = "dice_crafter:template_d20",
    recipe = {"dice_crafter:template_d6", paper, paper, paper}
})

-- core.register_craft({
--     type = "shapeless",
--     output = "dice_crafter:template_d20",
--     recipe = {"dice_crafter:template_d8", paper, paper}
-- })

core.register_craft({
    type = "shapeless",
    output = "dice_crafter:template_d20",
    recipe = {"dice_crafter:template_d12", paper}
})