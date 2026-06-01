-- ╔════════════════════════════════════════╗
-- ║          hosts/notebook.lua            ║
-- ║   Tudo que é exclusivo do Notebook     ║
-- ╚════════════════════════════════════════╝

-- ─── Monitor ─────────────────────────────────────────────────────────────────
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60.00",
    position = "auto",
    scale    = "1",
})

-- Monitor externo
hl.monitor({
    output     = "HDMI-A-1",
    mode       = "preferred",
    position   = "auto",
    scale      = "auto",
    mirror     = "eDP-1",
})

-- ─── Layout dwindle ──────────────────────────────────────────────────────────
hl.config({
    dwindle = {
        preserve_split         = true,
        force_split            = 2,
        split_width_multiplier = 1.1,
    },
})

-- ─── Input exclusivo do notebook ─────────────────────────────────────────────
hl.config({
    input = {
        kb_layout  = "br",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:swapescape",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll       = true,
            disable_while_typing = true,
        },
    },

    general = {
        gaps_in = 4,
        gaps_out = 8,
    },
})

-- ─── Keybinds exclusivos do notebook ─────────────────────────────────────────
local mainMod     = "SUPER"
-- Toggle waybar
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pkill waybar || waybar &"))
-- Mover janelas
hl.bind(mainMod .. " + left",     hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + right",     hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + up",     hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + down",     hl.dsp.window.move({ direction = "d" }))

-- Steam → workspace 2
hl.window_rule({
    name  = "workspace 2",
    match = { class = "steam" },
    workspace = "2 silent",
})

-- ─── AutoStart ─────────────────────────────────────────
hl.on("hyprland.start", function()
    -- ─── Battery Warning ───────────────────────────────────────────────────────────
    hl.exec_cmd("batsignal -w 15 -c 10 -d 5")
end)
