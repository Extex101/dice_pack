dice_crafter = {}
dice_crafter.registered_blueprints = {}

local path = minetest.get_modpath("dice_crafter")
dofile(path.."/recipes.lua")

dice.register_die("dice_crafter:template_coin", {
    tooltip = "Coin Template",
    preset = "coin",
    textures = {"dice_crafter_template_coin.png"},
    disable_popup = true,
    disable_message = true,
    disable_rename = true,
    face_count = 1,
    rest_time = 1.5,
    throw_velocity = 5,
    throw_kick = 0,
    min_shake_time = 0,
    sounds = dice.sounds.coin,
    groups = {dice_crafter_template = 1}
})

dice.register_die("dice_crafter:template_d6", {
    tooltip = "Six-Sided Die Template",
    preset = "d6",
    textures = {"dice_crafter_template_d6.png"},
    disable_popup = true,
    disable_message = true,
    disable_rename = true,
    face_count = 1,
    rest_time = 1.5,
    throw_velocity = 5,
    min_shake_time = 0,
    sounds = {
        shake = "dice_api_shake",
        fly = "dice_api_fly",
        first_impact = "dice_api_roll",
        hit = "dice_api_hit",
        land = "dice_api_hit",
        collect = "dice_api_hit"
    },
    groups = {dice_crafter_template = 6}
})

dice.register_die("dice_crafter:template_d12", {
    tooltip = "Twelve-Sided Die Template",
    preset = "d12",
    textures = {"dice_crafter_template_d12.png"},
    disable_popup = true,
    disable_message = true,
    disable_rename = true,
    face_count = 1,
    rest_time = 1.5,
    throw_velocity = 5,
    min_shake_time = 0,
    sounds = {
        shake = "dice_api_shake",
        fly = "dice_api_fly",
        first_impact = "dice_api_roll",
        hit = "dice_api_hit",
        land = "dice_api_hit",
        collect = "dice_api_hit"
    },
    groups = {dice_crafter_template = 12}
})

dice.register_die("dice_crafter:template_d20", {
    tooltip = "Twenty-Sided Die Template",
    preset = "d20",
    textures = {"dice_crafter_template_d20.png"},
    disable_popup = true,
    disable_message = true,
    disable_rename = true,
    face_count = 1,
    rest_time = 1.5,
    throw_velocity = 5,
    min_shake_time = 0,
    sounds = {
        shake = "dice_api_shake",
        fly = "dice_api_fly",
        first_impact = "dice_api_roll",
        hit = "dice_api_hit",
        land = "dice_api_hit",
        collect = "dice_api_hit"
    },
    groups = {dice_crafter_template = 20}
})

function dice_crafter.register_blueprint(name, def)
    def.groups = def.groups or {}
    def.groups.dice_crafter_blueprint = 1
    def.recipes = def.recipes or {}
    dice_crafter.registered_blueprints[name] = def
    core.register_craftitem(name, {
        description = dice.generate_description(def.tooltip or def.description, def.tooltip_colors),
        inventory_image = def.inventory_image,
        groups = def.groups
    })
end

core.register_node("dice_crafter:crafter", {
    description = "Dice Crafter",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, 0.4375, -0.5, -0.375, 0.5, 0.5},  --Edge
            {0.375, 0.4375, -0.5, 0.5, 0.5, 0.5},  --Edge
            {-0.5, 0.4375, -0.5, 0.5, 0.5, -0.375},  --Edge
            {-0.5, 0.4375, 0.375, 0.5, 0.5, 0.5},  --Edge
            {-0.5, 0.4375, -0.5, -0.3125, 0.5, -0.3125},  --Corner
            {0.3125, 0.4375, -0.5, 0.5, 0.5, -0.3125},  --Corner
            {0.3125, 0.4375, 0.3125, 0.5, 0.5, 0.5},  --Corner
            {-0.5, 0.4375, 0.3125, -0.3125, 0.5, 0.5},  --Corner
            {-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5}  --Table
        },
    },
    paramtype2 = "facedir",
    selection_box = {
        {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
    },
    sounds = xcompat.sounds.node_sound_wood_defaults(),
    tiles = {"dice_crafter_top.png", "dice_crafter_bottom.png", "dice_crafter_side.png", "dice_crafter_side.png", "dice_crafter_side.png", "dice_crafter_front.png"},
    groups = {choppy = 2,  handy = 1, axey = 1, deco_block = 1, material_wood = 1, flammable = -1 },
    _mcl_blast_resistance = 2.5,
	_mcl_hardness = 2.5,
    on_construct = function(pos)

        local formspec = "formspec_version[6]"..
        "size[10.5,11]"..
        "style_type[list;spacing=0.1875,0.25]"..
        "style_type[list:hovered;bgcolor=#006699]"..
        "background[0,0;0,0;dice_crafter_ui.png;true]"..
        "list[current_player;main;0.625,5.875;8,4;0]"..
        "listcolors[#00000000;#aa8c9cff]"..
        "list[context;ingredient;2.625,2.1875;1,1;]"..
        "list[context;blueprint;6.875,2.1875;1,1;]"..
        "list[context;output;4.75,3.0625;1,1;]"..
        "image[0,0;10.5,11;dice_crafter_ui_overlay.png]"..
        "listring[current_player;main]"..
        "listring[context;ingredient]"..
        "listring[current_player;main]"..
        "listring[context;output]"..
        "listring[current_player;main]"..
        "listring[context;blueprint]"
        
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec", formspec)
        local inv = meta:get_inventory()
        inv:set_size("ingredient", 1)
        inv:set_size("blueprint", 1)
        inv:set_size("output", 1)
    end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        if listname == "output" then
            return 0
        elseif listname == "blueprint" then
            if not dice_crafter.registered_blueprints[stack:get_name()] then
                return 0
            end
        end
        return stack:get_count()
    end,
    on_metadata_inventory_put = function(pos, from_list, from_index, to_list, to_index, count, player)
        local meta = minetest.get_meta(pos)
        local inventory = meta:get_inventory()
        local ingredient = inventory:get_stack("ingredient", 1)
        local blueprint = inventory:get_stack("blueprint", 1)
        if ingredient:get_count() > 0 and blueprint:get_count() > 0 then
            local recipeData = dice_crafter.registered_blueprints[blueprint:get_name()]
            if recipeData and #recipeData.recipes > 0 then
                for i, recipe in ipairs(recipeData.recipes) do
                    if recipe[1] == ingredient:get_name() then
                        inventory:set_stack("output", 1, recipe[2])
                        return
                    end
                end
            end
        end
        return
    end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        local meta = minetest.get_meta(pos)
        local inventory = meta:get_inventory()
        local blueprint = inventory:get_stack("blueprint", 1)
        local ingredient = inventory:get_stack("ingredient", 1)
        if listname == "output" then
            core.sound_play("dice_crafter_craft", {
                pos = pos,
                gain = 1
            })
            blueprint:take_item(1)
            ingredient:take_item(1)
            inventory:set_stack("blueprint", 1, blueprint)
            inventory:set_stack("ingredient", 1, ingredient)

            if ingredient:get_count() > 0 and blueprint:get_count() > 0 then
                local recipeData = dice_crafter.registered_blueprints[blueprint:get_name()]
                if recipeData and #recipeData.recipes > 0 then
                    for i, recipe in ipairs(recipeData.recipes) do
                        if recipe[1] == ingredient:get_name() then
                            inventory:set_stack("output", 1, recipe[2])
                            return
                        end
                    end
                end
            end
            return
        end
        
        if ingredient:get_count() == 0 or blueprint:get_count() == 0 then
            inventory:set_stack("output", 1, ItemStack(""))
        end
    end,
    on_destruct = function(pos)
        local inv = core.get_inventory({type = "node", pos = pos})
        if not inv then return end
        core.add_item(pos, inv:get_stack("ingredient", 1))
        core.add_item(pos, inv:get_stack("blueprint", 1))
    end
})
