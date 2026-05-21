-- ╔══════════════════════════════════════════════════════════════╗
-- ║              hosts/common.lua                                ║
-- ║   Base compartilhada — usada como fallback ou herança        ║
-- ╚══════════════════════════════════════════════════════════════╝

-- Monitor genérico (fallback para qualquer monitor conectado)
hl.monitor({
    output     = "",
    mode       = "preffered",
    position  = "auto",
    scale     = "1",
})

hl.config({
    -- ─── Input ───────────────────────────────────────────────────────────────
    input = {
        kb_layout    = "br",
        kb_variant   = "",
        kb_options   = "caps:escape",
        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll  = true,
            tap_to_click    = true,
            drag_lock        = false,
            scroll_factor   = 0.8,
        },
    },

    general = {
        gaps_in = 4,
        gaps_out = 8,
    }
})
