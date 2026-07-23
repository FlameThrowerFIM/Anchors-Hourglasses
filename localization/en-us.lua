return {
    descriptions = {
        Joker = {
            j_ananho_vainglorious = {
                name = "Vainglorious Joker",
                text = {
                    "Played cards with",
                    "{C:ananho_anchors}#2#{} suit give",
                    "{C:mult}+#1#{} Mult when scored",
                }
            },
            j_ananho_acedious = {
                name = "Acedious Joker",
                text = {
                    "Played cards with",
                    "{C:ananho_hourglasses}#2#{} suit give",
                    "{C:mult}+#1#{} Mult when scored",
                }
            },
            j_ananho_clampearl = {
                name = "Clam Pearl",
                text = {
                    "Played cards with",
                    "{C:ananho_anchors}#2#{} suit give",
                    "{C:white,X:chips}X#1#{} Chips",
                }
            },
            j_ananho_limestone = {
                name = "Limestone",
                text = {
                    "Played cards with {C:ananho_hourglasses}#4#{}",
                    "suit have a {C:green}#1# in #2#{} chance",
                    "to balance {C:chips}Chips{} and {C:mult}Mult{}",
                    "by {C:attention}#3#%{} when scored",
                }
            },
            j_ananho_fisherman = {
                name = "Fisherman",
                text = {
                    "Played {C:spades}Spades{} and {C:clubs}Clubs{}",
                    "become {C:ananho_anchors}Anchors{} when scored",
                }
            },
            j_ananho_navigation = {
                name = "Celestial Navigation",
                text = {
                    "{C:ananho_anchors}Anchors{} scored have a",
                    "{C:green}#1# in #2#{} chance to",
                    "create a random {C:planet}planet{} card",
                    "{C:green}#1# in #2#{} chance to",
                }
            },
            j_ananho_tablet = {
                name = "Tablet",
                text = {
                    "Create a random {C:tarot}Tarot{} card",
                    "if played hand contains",
                    "a {C:attention}Flush{} of {C:ananho_hourglasses}Hourglasses{}",
                    "{C:inactive}(Must have room){}"
                }
            },
            j_ananho_lurid = {
                name = "Lurid Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#",
                }
            },
            j_ananho_zealous = {
                name = "Zealous Joker",
                text = {
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                }
            },
            j_ananho_dynasty = {
                name = "The Dynasty",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_ananho_flyingdutchman = {
                name = "The Flying Dutchman",
                text = {
                    "Played cards with {C:ananho_anchors}Anchors{}",
                    "or {C:ananho_hourglasses}Hourglasses{} suits are",
                    "always used in scoring",
                    "and are {C:attention}retriggered{}"
                },
            },
            j_ananho_curator = {
                name = "Curator",
                text = {
                    "Earn {C:money}$#1#{} for each card with",
                    "{V:1}#2#{} suit drawn in the",
                    "first hand of each round,",
                    "{s:0.8}suit changes at end of round{}",
                },
            },
        },
        Tarot = {
            c_ananho_mermaid = {
                name = "The Mermaid",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}"
                }
            },
            c_ananho_clockmaker = {
                name = "The Clockmaker",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}"
                }
            }
        },
        Planet = {
            c_ananho_quaoar = {
                name = "Quaoar",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                }
            },
            c_ananho_haumea = {
                name = "Haumea",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                }
            },
            c_ananho_sedna = {
                name = "Sedna",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                }
            },
            c_ananho_makemake = {
                name = "Makemake",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                }
            }
        },
    },
    misc = {
        suits_plural = {
            ananho_Anchors = "Anchors",
            ananho_Hourglasses = "Hourglasses",
        },
        suits_singular = {
            ananho_Anchors = "Anchor",
            ananho_Hourglasses = "Hourglass",
        },
        poker_hands = {
            ["ananho_Spectrum"] = "Spectrum",
            ["ananho_Straight Spectrum"] = "Straight Spectrum",
            ["ananho_Straight Spectrum (Royal)"] = "Royal Spectrum",
            ["ananho_Spectrum House"] = "Spectrum House",
            ["ananho_Spectrum Five"] = "Spectrum Five",
        },
        poker_hand_descriptions = {
            ["ananho_Spectrum"] = {
                "5 cards with different suits"
            },
            ["ananho_Straight Spectrum"] = {
                "5 cards in a row (consecutive ranks),",
                "each with a different suit"
            },
            ["ananho_Spectrum House"] = {
                "A Three of a Kind and a Pair with",
                "each card having a different suit"
            },
            ["ananho_Spectrum Five"] = {
                "5 cards with the same rank,",
                "each with a different suit"
            },
        },
        dictionary = {
            k_ananho_translated_ex = "Translated!"
        }
    }
}
