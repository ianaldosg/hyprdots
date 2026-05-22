-- ╔══════════════════════════════════════════════════════════════╗
-- ║              hosts/desktop.lua                               ║
-- ║   Tudo que é exclusivo do PC Desktop                         ║
-- ╚══════════════════════════════════════════════════════════════╝

-- ─── Monitor ─────────────────────────────────────────────────────────────────
hl.monitor({
    output   = "DP-1",
    mode     = "3440x1440@159.96",
    position = "auto",
    scale    = "auto",
})

-- ─── Layout dwindle (split_width_multiplier do PC = 1.6) ─────────────────────
hl.config({
    dwindle = {
        preserve_split         = true,
        force_split            = 2,
        split_width_multiplier = 1.6,
    },
})

-- ─── Input exclusivo do PC ───────────────────────────────────────────────────
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "intl",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,
    },

    general = {
        gaps_in = 6,
        gaps_out = 12,
    },
})

-- ─── Keybinds exclusivos do PC ───────────────────────────────────────────────
local mainMod     = "SUPER"
-- Toggle waybar
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("pkill waybar || waybar &"))

-- Mover janela com WASD 
hl.bind(mainMod .. " + W", hl.dsp.window.move({ direction = "up"    }))
hl.bind(mainMod .. " + A", hl.dsp.window.move({ direction = "left"  }))
hl.bind(mainMod .. " + S", hl.dsp.window.move({ direction = "down"  }))
hl.bind(mainMod .. " + D", hl.dsp.window.move({ direction = "right" }))

-- ─── Window rules exclusivas do PC ───────────────────────────────────────────
-- Jogos e launchers → workspaces 2 e 3
local game_rules = {
    ["2"] = "steam|CurseForge|heroic|desmume",
    ["3"] = "steam_app_default|Minecraft",
}

for ws, apps in pairs(game_rules) do
    hl.window_rule({
        name  = "workspace-games-" .. ws,
        match = { class = apps },
        workspace = ws .. " silent",
    })
end
