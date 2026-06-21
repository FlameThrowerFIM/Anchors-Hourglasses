SMODS.Atlas {
    key = "Suits",
    path = "AnchorsHourglassesSuits.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "SuitsHC",
    path = "AnchorsHourglassesSuitsHC.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "SuitUI",
    path = "AnchorsHourglassesSuitUI.png",
    px = 18,
    py = 18
}

SMODS.Atlas {
    key = "SuitUIHC",
    path = "AnchorsHourglassesSuitUIHC.png",
    px = 18,
    py = 18
}

function anchors_and_hourglasses_has_suit(suit, ignore_wild)
    for _, v in ipairs(G.playing_cards or {}) do
        if not SMODS.has_no_suit(v) and (v.base.suit == suit or (not ignore_wild and v:is_suit(suit))) then
            return true
        end
    end
    return false
end

SMODS.Suit {
    key = "Anchors",
    card_key = "ANCHORS",
    lc_atlas = "Suits",
    lc_ui_atlas = "SuitUI",
    lc_colour = G.C.ANCHORSHOURGLASSES.ANCHORS_LC,

    hc_atlas = "SuitsHC",
    hc_ui_atlas = "SuitUIHC",
    hc_colour = G.C.ANCHORSHOURGLASSES.ANCHORS_HC,
    pos = { y = 0 },
    ui_pos = { x = 0, y = 0 },
    in_pool = function(self, args)
        if args and args.anchors_and_hourglasses and args.anchors_and_hourglasses.include_anchors then
            return true
        end

        if args and args.initial_deck and false then
            -- When creating a deck
            local back = G.GAME.selected_back
            local back_config = back and back.effect.center.paperback

            local sleeve = G.GAME.selected_sleeve
            local sleeve_config = (G.P_CENTERS[sleeve] or {}).paperback

            return (back_config and back_config.create_crowns)
                or (sleeve_config and sleeve_config.create_crowns)
        else
            return anchors_and_hourglasses_has_suit("ananho_Anchors", true)
        end
    end
}

SMODS.Suit {
    key = "Hourglasses",
    card_key = "HOURGLASSES",
    lc_atlas = "Suits",
    lc_ui_atlas = "SuitUI",
    lc_colour = G.C.ANCHORSHOURGLASSES.HOURGLASSES_LC,

    hc_atlas = "SuitsHC",
    hc_ui_atlas = "SuitUIHC",
    hc_colour = G.C.ANCHORSHOURGLASSES.HOURGLASSES_HC,
    pos = { y = 1 },
    ui_pos = { x = 1, y = 0 },
    in_pool = function(self, args)
        if args and args.anchors_and_hourglasses and args.anchors_and_hourglasses.include_hourglasses then
            return true
        end

        if args and args.initial_deck and false then
            -- When creating a deck
            local back = G.GAME.selected_back
            local back_config = back and back.effect.center.paperback

            local sleeve = G.GAME.selected_sleeve
            local sleeve_config = (G.P_CENTERS[sleeve] or {}).paperback

            return (back_config and back_config.create_crowns)
                or (sleeve_config and sleeve_config.create_crowns)
        else
            return anchors_and_hourglasses_has_suit("ananho_Hourglasses", true)
        end
    end
}