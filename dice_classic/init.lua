dice.register_die("dice_classic:coin", {
    tooltip = {
        "\\yellow\\Coin",
        "",
        "Two-Sided",
        "\\green\\    -    Classic Pack",
        "\\green\\    -    Heads/Tails",
    },
    preset = "coin",
    textures = {"dice_classic_coin.png"},
    sounds = dice.sounds.coin,
    groups = {
        dice_classic = 2,
    },
})

dice.register_die("dice_classic:classic_d4", {
    tooltip = {
        "\\green\\D4",
        "",
        "Four-Sided",
        "\\green\\    -    Classic Pack",
        "\\green\\    -    Arabic Numerals",
    },
    preset = "d4",
    textures = {"dice_classic_d4.png"},
    sounds = dice.sounds.die,
    groups = {
        dice_classic = 4,
    },
})

dice.register_die("dice_classic:classic_d6", {
    tooltip = {
        "\\green\\D6",
        "",
        "Six-Sided",
        "\\green\\    -    Classic Pack",
        "\\green\\    -    Pips",
    },
    preset = "d6",
    textures = {"dice_classic_d6.png"},
    sounds = dice.sounds.die,
    groups = {
        dice_classic = 6,
    },
})

dice.register_die("dice_classic:classic_d8", {
    tooltip = {
        "\\green\\D8",
        "",
        "Eight-Sided",
        "\\green\\    -    Classic Pack",
        "\\green\\    -    Arabic Numerals",
    },
    preset = "d8",
    textures = {"dice_classic_d8.png"},
    sounds = dice.sounds.die,
    groups = {
        dice_classic = 8,
    },
})

dice.register_die("dice_classic:classic_d12", {
    tooltip = {
        "\\green\\D12",
        "",
        "Twelve-Sided",
        "\\green\\    -    Classic Pack",
        "\\green\\    -    Arabic Numerals",
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
        "\\green\\D20",
        "",
        "Twenty-Sided",
        "\\green\\   -    Classic Pack",
        "\\green\\   -    Arabic Numerals",
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
            "dice_crafter:template_d4",
            "dice_classic:classic_d4"
        },
        {
            "dice_crafter:template_d6",
            "dice_classic:classic_d6"
        },
        {
            "dice_crafter:template_d8",
            "dice_classic:classic_d8"
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
    tooltip = {"\\green\\Classic Blueprint"},
    inventory_image = "dice_classic_blueprint.png",
    groups = {dice_blueprint_classic = 1}
})

local paper = xcompat.materials.paper or ""
local black = xcompat.materials.dye_black or ""
core.register_craft({
    output = "dice_classic:blueprint",
    recipe = {
        {black, black},
        {paper, paper},
        {paper, paper},
    }
})