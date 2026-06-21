-- This code was taken from Paperback. Thanks! ^u^

function ananho_get_unique_suits(scoring_hand, bypass_debuff, flush_calc)
    local suits = {}

    for k, _ in pairs(SMODS.Suits) do
        suits[k] = 0
    end

    for _, card in ipairs(scoring_hand) do
        if not SMODS.has_any_suit(card) then
            for suit, count in pairs(suits) do
                if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
                    suits[suit] = count + 1
                    break
                end
            end
        end
    end

    for _, card in ipairs(scoring_hand) do
        if SMODS.has_any_suit(card) then
            for suit, count in pairs(suits) do
                if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
                    suits[suit] = count + 1
                    break
                end
            end
        end
    end

    local num_suits = 0

    for _, v in pairs(suits) do
        if v > 0 then num_suits = num_suits + 1 end
    end

    return num_suits
end

SMODS.PokerHandPart {
    key = "spectrum",
    func = function(hand)
        if #hand < 5 then return {} end
        local unique_suits = ananho_get_unique_suits(hand, nil, true)
        return (unique_suits >= 5) and { hand } or {}
    end
}

SMODS.PokerHand {
    key = "Spectrum",
    visible = false,
    chips = 50,
    mult = 6,
    l_chips = 20,
    l_mult = 2,
    example = {
        { "S_2",              true },
        { "D_7",              true },
        { "C_3",              true },
        { "ananho_ANCHORS_5", true },
        { "H_K",              true },
    },

    evaluate = function(parts)
        return parts.ananho_spectrum
    end
}

SMODS.PokerHand {
    key = "Straight Spectrum",
    visible = false,
    chips = 120,
    mult = 10,
    l_chips = 45,
    l_mult = 4,
    example = {
        { "S_Q",              true },
        { "ananho_ANCHORS_J", true },
        { "C_T",              true },
        { "D_9",              true },
        { "H_8",              true }
    },

    evaluate = function(parts)
        if not next(parts.ananho_spectrum) or not next(parts._straight) then return {} end
        return { SMODS.merge_lists(parts.ananho_spectrum, parts._straight) }
    end,

    modify_display_text = function(self, _cards, scoring_hand)
        local royal = true
        for j = 1, #scoring_hand do
            local rank = not SMODS.has_no_rank(scoring_hand[j]) and SMODS.Ranks[scoring_hand[j].base.value]
            royal = rank and royal and (rank.key == "Ace" or rank.key == "10" or rank.face)
        end

        if royal then
            return self.key .. " (Royal)"
        end
    end
}

SMODS.PokerHand {
    key = "Spectrum House",
    above_hand = "Flush House",
    visible = false,
    chips = 150,
    mult = 15,
    l_chips = 40,
    l_mult = 4,
    example = {
        { "S_Q",                  true },
        { "ananho_HOURGLASSES_Q", true },
        { "C_Q",                  true },
        { "D_8",                  true },
        { "H_8",                  true }
    },

    evaluate = function(parts)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts.ananho_spectrum) then return {} end
        return { SMODS.merge_lists(parts._all_pairs, parts.ananho_spectrum) }
    end
}

SMODS.PokerHand {
    key = "Spectrum Five",
    above_hand = "Flush Five",
    visible = false,
    chips = 180,
    mult = 18,
    l_chips = 55,
    l_mult = 3,
    example = {
        { "S_7",                  true },
        { "D_7",                  true },
        { "ananho_HOURGLASSES_7", true },
        { "H_7",                  true },
        { "C_7",                  true }
    },

    evaluate = function(parts)
        if not next(parts._5) or not next(parts.ananho_spectrum) then return {} end
        return { SMODS.merge_lists(parts._5, parts.ananho_spectrum) }
    end
}
