-- ╔══════════════════════════════════════════════════════════════╗
-- ║              modules/windowrules.lua                         ║
-- ║   Regras de janelas compartilhadas                           ║
-- ║                                                              ║
-- ║   Regras exclusivas do PC (steam, CurseForge, etc.)          ║
-- ║   ficam em hosts/desktop.lua                                 ║
-- ╚══════════════════════════════════════════════════════════════╝

-- ─── Firefox → workspace 1 ──────────────────────────────────
hl.window_rule({
    name  = "workspace 1",
    match = { class = "firefox" },
    workspace = "1",
})

-- ─── Suppress maximize ──────────────────────────────────────
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- ─── Fix XWayland drag  ──────────────────────────────────────
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- ─── Utilidade: aplicar várias regras de uma vez ─────────────────────────────
local function rules(match, rule_list)
    for _, rule in ipairs(rule_list) do
        hl.window_rule(rule, match)
    end
end

-- ─── Regras por classe ───────────────────────────────────────────────────────

-- Kitty em modo scratchpad
rules({ class = "kitty", title = "scratch" }, {
    { float = true },
    { size = "900 500" },
    { center = true },
    { opacity = "0.95 0.90" },
})

-- ─── Regras globais ──────────────────────────────────────────────────────────

-- Janelas XWayland: bordas diferentes para identificação visual
--hl.windowrule(
--    { ["col.border"] = "rgba(ff6c6baa) rgba(da8548aa) 45deg" },
--    { xwayland = true }
--)

-- Tearing para jogos (melhor performance)
hl.window_rule({ immediate = true }, { class = ".*\\.exe" })  -- Wine/Proton

-- ─── Taskbar Hero ──────────────────────────────────────────────────────────
hl.window_rule({
    match = {
        class = "steam_app_3678970",
    },

    workspace = "3 silent",
    float = true,
    border_size = 0,
    no_blur = true,
    no_shadow = true,
    --pin = true,
})

-- ─── Pesquisar ──────────────────────────────────────────────────────────

-- ─── hyprland-run (igual nos dois) ───────────────────────────────────────────
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- ─── Smart gaps (descomentado quando quiser usar) ────────────────────────────
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- ─── Layer rules (descomentado quando quiser usar) ───────────────────────────
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

