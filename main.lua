--[[SMODS.Atlas {
  key = "modicon",
  path = "AnchorsHourglassesIcon.png",
  px = 34,
  py = 34
}]]--

if not to_big then to_big = function(x) return x end end

G.C.ANCHORSHOURGLASSES = {
  ANCHORS_LC = HEX("58DAB0"),
  ANCHORS_HC = HEX("29D653"),
  HOURGLASSES_LC = HEX("AC684D"),
  HOURGLASSES_HC = HEX("E97625")
}

local allFolders = { "none", "items" }

local allFiles = { ["none"] = {}, ["items"] = { "Suits", "Hands", "Jokers", "Tarots", "Planets" } }

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