SMODS.Atlas {
  key = "Tarots",
  path = "AnchorsHourglassesTarots.png",
  px = 71,
  py = 95
}

SMODS.Tarot {
  key = "mermaid",
  pos = { x = 1, y = 0 },
  config = { max_highlighted = 3, suit_conv = "ananho_Anchors" },
  atlas = "Tarots",
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, "suits_plural"), colours = { G.C.SUITS[card.ability.suit_conv] } } }
  end
}

SMODS.Tarot {
  key = "clockmaker",
  pos = { x = 0, y = 0 },
  config = { max_highlighted = 3, suit_conv = "ananho_Hourglasses" },
  atlas = "Tarots",
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, "suits_plural"), colours = { G.C.SUITS[card.ability.suit_conv] } } }
  end
}