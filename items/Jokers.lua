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
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then return { mult = card.ability.extra.s_mult } end
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
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then return { mult = card.ability.extra.s_mult } end
  end
}
