-- ╔══════════════════════════════════════════╗
-- ║           modules/autostart.lua          ║
-- ║   Programas que iniciam com o Hyprland   ║
-- ╚══════════════════════════════════════════╝

hl.on("hyprland.start", function()
    -- ─── Autenticação ─────────────────────────────────────────────────────────
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- ─── Waybar ─────────────────────────────────────────────────────
    hl.exec_cmd("waybar")

    -- ─── Wallpaper ───────────────────────────────────────────────────────────
    hl.exec_cmd("hyprpaper")

    -- ─── Cursor ──────────────────────────────────────────────────────────────
    -- hl.exec_cmd("hyprctl setcursor Catppuccin-Mocha-Dark-Cursors 24")

end)
