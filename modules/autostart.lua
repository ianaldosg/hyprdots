-- ╔══════════════════════════════════════════╗
-- ║           modules/autostart.lua          ║
-- ║   Programas que iniciam com o Hyprland   ║
-- ╚══════════════════════════════════════════╝

hl.on("hyprland.start", function()
    -- ─── Autenticação ─────────────────────────────────────────────────────────
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- ─── Waybar ─────────────────────────────────────────────────────
    hl.exec_cmd("waybar")

    -- ─── Notificações ─────────────────────────────────────────────────────────
    hl.exec_cmd("swaync")

    -- ─── Wallpaper ───────────────────────────────────────────────────────────
    hl.exec_cmd("hyprpaper")

    -- ─── Áudio ───────────────────────────────────────────────────────────────
    hl.exec_cmd("pipewire")
    hl.exec_cmd("pipewire-pulse")
    hl.exec_cmd("wireplumber")

    -- ─── Cursor ──────────────────────────────────────────────────────────────
    -- hl.exec_cmd("hyprctl setcursor Catppuccin-Mocha-Dark-Cursors 24")

end)
