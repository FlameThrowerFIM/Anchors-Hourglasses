--[[SMODS.Atlas {
  key = "modicon",
  path = "AnchorsHourglassesIcon.png",
  px = 34,
  py = 34
}]] --

if not to_big then to_big = function(x) return x end end

G.C.ANCHORSHOURGLASSES = {
  ANCHORS_LC = HEX("58DAB0"),
  ANCHORS_HC = HEX("29D653"),
  HOURGLASSES_LC = HEX("AC684D"),
  HOURGLASSES_HC = HEX("E97625")
}

function SMODS.current_mod.reset_game_globals(run_start)
  G.GAME.current_round.ananho_curator_suit = G.GAME.current_round.ananho_curator_suit or { suit = "Spades" }
  local all_suits_curator = {}
  for _, v in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(v) then
      all_suits_curator[v.base.suit] = true
    end
  end
  all_suits_curator.Hearts = true
  all_suits_curator.Clubs = true
  all_suits_curator.Diamonds = true
  all_suits_curator.Spades = true
  local valid_suits_curator = {}
  for k, v in pairs(all_suits_curator) do
    if k ~= G.GAME.current_round.ananho_curator_suit then valid_suits_curator[#valid_suits_curator + 1] = k end
  end
  if next(valid_suits_curator) then
    local chosen_suit = pseudorandom_element(valid_suits_curator,
      pseudoseed("ananho_curator" .. G.GAME.round_resets.ante))
    G.GAME.current_round.ananho_curator_suit = chosen_suit
  end
end

local allFolders = { "none", "items" }

local allFiles = { ["none"] = {}, ["items"] = { "Suits", "Decks", "Hands", "Jokers", "Tarots", "Planets", "DeckSkins" } }

for i = 1, #allFolders do
  if allFolders[i] == "none" then
    for j = 1, #allFiles[allFolders[i]] do
      assert(SMODS.load_file(allFiles[allFolders[i]][j] .. ".lua"))()
    end
  else
    for j = 1, #allFiles[allFolders[i]] do
      assert(SMODS.load_file(allFolders[i] .. "/" .. allFiles[allFolders[i]][j] .. ".lua"))()
    end
  end
end
