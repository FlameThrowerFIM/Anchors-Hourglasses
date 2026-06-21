SMODS.Atlas {
    key = "Planets",
    path = "AnchorsHourglassesPlanets.png",
    px = 71,
    py = 95
}

SMODS.Planet {
    key = "quaoar",
    atlas = "Planets",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, "poker_hands"),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (to_big(G.GAME.hands[card.ability.hand_type].level) == to_big(1) and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    discovered = false,
    unlocked = true,
    is_dwarf = true,
    config = {
        hand_type = "ananho_Spectrum",
        softlock = true
    }
}

SMODS.Planet {
    key = "haumea",
    atlas = "Planets",
    pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, "poker_hands"),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (to_big(G.GAME.hands[card.ability.hand_type].level) == to_big(1) and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    discovered = false,
    unlocked = true,
    is_dwarf = true,
    config = {
        hand_type = "ananho_Straight Spectrum",
        softlock = true,
    }
}

SMODS.Planet {
    key = "sedna",
    atlas = "Planets",
    pos = { x = 2, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, "poker_hands"),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (to_big(G.GAME.hands[card.ability.hand_type].level) == to_big(1) and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    discovered = false,
    unlocked = true,
    is_dwarf = true,
    config = {
        hand_type = "ananho_Spectrum House",
        softlock = true,
    }
}

SMODS.Planet {
    key = "makemake",
    atlas = "Planets",
    pos = { x = 3, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, "poker_hands"),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (to_big(G.GAME.hands[card.ability.hand_type].level) == to_big(1) and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    discovered = false,
    unlocked = true,
    is_dwarf = true,
    config = {
        hand_type = "ananho_Spectrum Five",
        softlock = true,
    }
}
