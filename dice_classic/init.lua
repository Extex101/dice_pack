dice.register_die("dice_classic:coin", {
    tooltip = {
        "\\YELLOW\\Coin",
        "",
        "Two-Sided", 
        "\\GREEN\\    -    Classic Pack",
        "\\GREEN\\    -    Heads/Tails",
    },
    preset = "coin",
    textures = {"dice_classic_coin.png"},
    sounds = dice.sounds.coin,
    groups = {
        dice_classic = 2,
    },
})

dice.register_die("dice_classic:classic_d6", {
    tooltip = {
        "\\GREEN\\D6",
        "",
        "Six-Sided", 
        "\\GREEN\\    -    Classic Pack",
        "\\GREEN\\    -    Pips",
    },
    preset = "d6",
    textures = {"dice_classic_d6.png"},
    sounds = dice.sounds.die,
    groups = {
        dice_classic = 6,
    },
})

dice.register_die("dice_classic:classic_d12", {
    tooltip = {
        "\\GREEN\\D12",
        "",
        "Twelve-Sided", 
        "\\GREEN\\    -    Classic Pack",
        "\\GREEN\\    -    Arabic Numerals",
    },
    preset = "d12",
    textures = {"dice_classic_d12.png"},
    sounds = dice.sounds.die,
    groups = {
        dice_classic = 12,
    },
})

dice.register_die("dice_classic:classic_d20", {
    tooltip = {
        "\\GREEN\\D20",
        "",
        "Twenty-Sided", 
        "\\GREEN\\   -    Classic Pack",
        "\\GREEN\\   -    Arabic Numerals",
    },
    preset = "d20",
    textures = {"dice_classic_d20.png"},
    sounds = dice.sounds.die,
    groups = {
        dice_classic = 20,
    },
})


dice_crafter.register_blueprint("dice_classic:blueprint", {
    recipes = {
        {
            "dice_crafter:template_d6",
            "dice_classic:classic_d6"
        },
        {
            "dice_crafter:template_d12",
            "dice_classic:classic_d12"
        },
        {
            "dice_crafter:template_d20",
            "dice_classic:classic_d20"
        },
        {
            "dice_crafter:template_coin",
            "dice_classic:coin"
        }
    },
    tooltip = {"\\GREEN\\Classic Blueprint"},
    inventory_image = "dice_classic_blueprint.png",
    groups = {dice_blueprint_classic = 1}
})


local paper = xcompat.materials.paper
local black = xcompat.materials.dye_black
core.register_craft({
    output = "dice_classic:blueprint",
    recipe = {
        {black, black},
        {paper, paper},
        {paper, paper},
    }
})