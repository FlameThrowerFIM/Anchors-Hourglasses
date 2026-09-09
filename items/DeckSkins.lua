SMODS.Atlas {
  key = "AnchorsPikminLC",
  path = "AnchorsHourglassesPikminCollabLC.png",
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = "AnchorsPikminHC",
  path = "AnchorsHourglassesPikminCollabHC.png",
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = "HourglassesLaytonLC",
  path = "AnchorsHourglassesLaytonCollabLC.png",
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = "HourglassesLaytonHC",
  path = "AnchorsHourglassesLaytonCollabHC.png",
  px = 71,
  py = 95
}

SMODS.DeckSkin {
  key = "anchors_pikmin",
  suit = "ananho_Anchors",
  loc_txt = {
    ["en-us"] = "Pikmin"  --TODO: replace with a localisation file version
  },
  palettes = {
    {
      key = "lc",
      ranks = { "Jack", "Queen", "King" },
      display_ranks = { "Jack", "Queen", "King" },
      atlas = "ananho_AnchorsPikminLC",
      pos_style = "collab"
    },
    {
      key = "hc",
      ranks = { "Jack", "Queen", "King" },
      display_ranks = { "Jack", "Queen", "King" },
      atlas = "ananho_AnchorsPikminHC",
      pos_style = "collab"
    }
  }
}

SMODS.DeckSkin {
  key = "hourglasses_layton",
  suit = "ananho_Hourglasses",
  loc_txt = {
    ["en-us"] = "Professor Layton"  --TODO: replace with a localisation file version
  },
  palettes = {
    {
      key = "lc",
      ranks = { "Jack", "Queen", "King" },
      display_ranks = { "Jack", "Queen", "King" },
      atlas = "ananho_HourglassesLaytonLC",
      pos_style = "collab"
    },
    {
      key = "hc",
      ranks = { "Jack", "Queen", "King" },
      display_ranks = { "Jack", "Queen", "King" },
      atlas = "ananho_HourglassesLaytonHC",
      pos_style = "collab"
    }
  }
}