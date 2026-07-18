SMODS.Atlas {
  key = "Jokers",
  path = "AnchorsHourglassesJokers.png",
  px = 71,
  py = 95
}











SMODS.Joker {
  key = "vainglorious",
  atlas = "Jokers",
  pos = { x = 0, y = 0 },
  rarity = 1,
  blueprint_compat = true,
  cost = 5,
  config = { extra = { s_mult = 3, suit = "ananho_Anchors" }, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, "suits_singular") } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
      return {
        mult =
            card.ability.extra.s_mult
      }
    end
  end
}

SMODS.Joker {
  key = "acedious",
  atlas = "Jokers",
  pos = { x = 1, y = 0 },
  rarity = 1,
  blueprint_compat = true,
  cost = 5,
  config = { extra = { s_mult = 3, suit = "ananho_Hourglasses" }, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, "suits_singular") } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
      return {
        mult =
            card.ability.extra.s_mult
      }
    end
  end
}

SMODS.Joker {
  key = "clampearl",
  atlas = "Jokers",
  blueprint_compat = true,
  rarity = 2,
  cost = 7,
  pos = { x = 2, y = 0 },
  config = { extra = { xchips = 1.25, suit = "ananho_Anchors" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xchips, localize(card.ability.extra.suit, "suits_singular") } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
      return { xchips = card.ability.extra.xchips }
    end
  end,
  in_pool = function()
    return anchors_and_hourglasses_has_suit("ananho_Anchors", true)
  end
}


-- This code was taken from All in Jest. Thanks! ^u^
table.insert(SMODS.calculation_keys, "ananho_balance_percent")
if SMODS.other_calculation_keys then
  table.insert(SMODS.other_calculation_keys, "ananho_balance_percent")
end

local ananho_balance_mixed = false

local ananho_original_smods_calculate_individual_effect = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
  if key == "ananho_balance_percent" then
    if amount > 1 then
      amount = 1
    end
    if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
    new_hand_chips, new_mult = calculate_balance_percent_values(hand_chips, mult, amount)

    SMODS.Scoring_Parameters.chips:modify(new_hand_chips - hand_chips)
    SMODS.Scoring_Parameters.mult:modify(new_mult - mult)

    local text = (amount * 100) .. "%"

    G.E_MANAGER:add_event(Event({
      trigger = "immediate",
      func = (function()
        ease_colour(G.C.UI_CHIPS, mix_colours({ 0.8, 0.45, 0.85, 1 }, G.C.UI_CHIPS, amount))
        ease_colour(G.C.UI_MULT, mix_colours({ 0.8, 0.45, 0.85, 1 }, G.C.UI_MULT, amount))
        if not ananho_balance_mixed then
          ananho_balance_mixed = true
          G.E_MANAGER:add_event(Event({
            trigger = "after",
            blockable = false,
            blocking = false,
            delay = 6.3,
            func = (function()
              if G.STATE ~= 2 then
                ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                ease_colour(G.C.UI_MULT, G.C.RED, 2)
                ananho_balance_mixed = false
                return true
              end
            end)
          }))
        end
        return true
      end)
    }))

    if not effect.remove_default_message then
      if from_edition then
        card_eval_status_text(scored_card, "jokers", nil, percent, nil,
          { message = text, colour = { 0.8, 0.45, 0.85, 1 }, sound = "gong", edition = true })
      else
        card_eval_status_text(
          effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, "extra", nil,
          percent, nil, { message = text, colour = { 0.8, 0.45, 0.85, 1 }, sound = "gong", edition = true })
      end
    end

    return true
  end

  return ananho_original_smods_calculate_individual_effect(effect, scored_card, key, amount, from_edition)
end

calculate_balance_percent_values = calculate_balance_percent_values or function(input_hand_chips, input_mult, percent)
  local chip_mod = percent * input_hand_chips
  local mult_mod = percent * input_mult
  local avg = (chip_mod + mult_mod) / 2
  local new_hand_chips = input_hand_chips + (avg - chip_mod)
  local new_mult = input_mult + (avg - mult_mod)

  return new_hand_chips, new_mult
end


SMODS.Joker {
  key = "limestone",
  atlas = "Jokers",
  blueprint_compat = true,
  rarity = 2,
  cost = 7,
  pos = { x = 3, y = 0 },
  config = { extra = { odds = 3, percent = 15, suit = "ananho_Hourglasses" } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "ananho_limestone")
    return { vars = { numerator, denominator, card.ability.extra.percent, localize(card.ability.extra.suit, "suits_singular") } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) and
        SMODS.pseudorandom_probability(card, "ananho_limestone", 1, card.ability.extra.odds) then
      return { ananho_balance_percent = card.ability.extra.percent / 100 }
    end
  end,
  in_pool = function()
    return anchors_and_hourglasses_has_suit("ananho_Hourglass", true)
  end
}

SMODS.Joker {
  key = "fisherman",
  atlas = "Jokers",
  blueprint_compat = true,
  rarity = 2,
  cost = 6,
  pos = { x = 4, y = 0 },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and (context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs")) then
      local _card = context.other_card

      G.E_MANAGER:add_event(Event({
        trigger = "before",
        delay = 0.4,
        func = function()
          play_sound("tarot1")
          card:juice_up()
          _card:flip()
          play_sound("card1", 1)
          _card:juice_up(0.3, 0.3)
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = "before",
        delay = 0.2,
        func = function()
          _card:change_suit("ananho_Anchors")
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        delay = 0.1,
        func = function()
          _card:flip()
          play_sound("tarot2", 1)
          _card:juice_up(0.3, 0.3)
          return true
        end
      }))
      return { message = localize("ananho_Anchors", "suits_plural"), colour = G.C.SUITS["ananho_Anchors"] }
    end
  end
}



SMODS.Joker {
  key = "navigation",
  atlas = "Jokers",
  blueprint_compat = true,
  rarity = 2,
  cost = 7,
  pos = { x = 1, y = 1 },
  config = { extra = { numerator = 1, denominator = 5, suit = "ananho_Anchors" } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator,
      card.ability.extra.denominator, "ananho_navigation" .. G.GAME.round_resets.ante)
    return { vars = { numerator, denominator, localize(card.ability.extra.suit, "suits_singular") } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      if context.other_card:is_suit(card.ability.extra.suit) and
          SMODS.pseudorandom_probability(card, "ananho_navigation" .. G.GAME.round_resets.ante,
            card.ability.extra.numerator, card.ability.extra.denominator) then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound("timpani")
            SMODS.add_card({ set = "Planet", key_append = "ananho_navigation" })
            G.GAME.consumeable_buffer = 0
            return true
          end
        }))
        return {
          message = localize("k_plus_planet"),
          colour = G.C.SECONDARY_SET.Planet,
          message_card = context.other_card
        }
      end
    end
  end,
  in_pool = function()
    return anchors_and_hourglasses_has_suit("ananho_Anchors", true)
  end
}

SMODS.Joker {
  key = "tablet",
  atlas = "Jokers",
  blueprint_compat = true,
  rarity = 2,
  cost = 7,
  pixel_size = { w = 55, h = 95 },
  pos = { x = 3, y = 1 },
  config = { extra = { hand = "Flush", suit = "ananho_Hourglasses" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { localize(card.ability.extra.hand, "poker_hands"), localize(card.ability.extra.suit, "suits_singular") } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands["Flush"]) then
      local valid = true
      for _, v in ipairs(context.scoring_hand) do
        if not v:is_suit("ananho_Hourglasses") then
          valid = false
          break
        end
      end

      if valid and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound("timpani")
            SMODS.add_card({ set = "Tarot", key_append = "ananho_tablet" })
            G.GAME.consumeable_buffer = 0
            return true
          end
        }))
        return {
          message = localize("k_ananho_translated_ex"),
          colour = G.C.SECONDARY_SET.Tarot,
          message_card = context.other_card
        }
      end
    end
  end,
  in_pool = function()
    return anchors_and_hourglasses_has_suit("ananho_Hourglass", true)
  end
}

SMODS.Joker {
  key = "lurid",
  atlas = "Jokers",
  blueprint_compat = true,
  rarity = 1,
  cost = 4,
  pos = { x = 1, y = 2 },
  config = { extra = { chips = 80, type = "ananho_Spectrum" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, localize(card.ability.extra.type, "poker_hands") } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return { chips = card.ability.extra.chips }
    end
  end,
  in_pool = function()
    return G.GAME.hands["ananho_Spectrum"].played > 0
  end
}

SMODS.Joker {
  key = "zealous",
  atlas = "Jokers",
  blueprint_compat = true,
  rarity = 1,
  cost = 4,
  pos = { x = 0, y = 2 },
  config = { extra = { mult = 10, type = "ananho_Spectrum" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, localize(card.ability.extra.type, "poker_hands") } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return { mult = card.ability.extra.mult }
    end
  end,
  in_pool = function()
    return G.GAME.hands["ananho_Spectrum"].played > 0
  end
}

SMODS.Joker {
  key = "dynasty",
  atlas = "Jokers",
  blueprint_compat = true,
  rarity = 3,
  cost = 8,
  pos = { x = 2, y = 2 },
  config = { extra = { Xmult = 3, type = "ananho_Spectrum" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult, localize(card.ability.extra.type, "poker_hands") } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return { xmult = card.ability.extra.Xmult }
    end
  end,
  in_pool = function()
    return G.GAME.hands["ananho_Spectrum"].played > 0
  end
}

SMODS.Joker {
  key = "curator",
  atlas = "Jokers",
  blueprint_compat = true,
  rarity = 2,
  cost = 6,
  pos = { x = 4, y = 1 },
  config = { extra = { money_per = 1 } },
  loc_vars = function(self, info_queue, card)
    local suit = G.GAME.current_round.ananho_curator_suit or "Spades"
    return { vars = { card.ability.extra.money_per, localize(suit, "suits_plural"), colours = { G.C.SUITS[suit] } } }
  end,
  calculate = function(self, card, context)
    if context.first_hand_drawn then
      local money = 0
      for _, v in ipairs(context.hand_drawn) do
        if v:is_suit(G.GAME.current_round.ananho_curator_suit) then
          money = money + 1
        end
      end
      if money > 0 then return { dollars = money * card.ability.extra.money_per } end
    end
  end
}
