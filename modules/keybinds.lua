-- ╔══════════════════════════════════════════════════════════════╗
-- ║              modules/keybinds.lua                            ║
-- ║   Atalhos compartilhados entre notebook e PC                 ║
-- ║                                                              ║
-- ║   Binds exclusivos de cada máquina ficam em hosts/*.lua:     ║
-- ║     • notebook: SUPER+W  = toggle waybar                     ║
-- ║     • desktop:  SUPER+Y  = toggle waybar                     ║
-- ║                 WASD     = mover janela                      ║
-- ╚══════════════════════════════════════════════════════════════╝

-- mainMod, terminal, fileManager, menu são globais definidos em hyprland.lua
-- ─── Programas (global para os outros módulos enxergarem) ────────────────────
local mainMod     = "SUPER"
local browser     = "firefox"
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "walker"

-- ─── Aplicativos ─────────────────────────────────────────────────────────────
hl.bind(mainMod .. " + Q",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",     hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F",     hl.dsp.exec_cmd(browser))

-- ─── Screenshots ─────────────────────────────────────────────────────────────
hl.bind("ALT + P", hl.dsp.exec_cmd("hyprshot -m region -o ~/Screenshots -z"))
hl.bind("SHIFT + ALT + P", hl.dsp.exec_cmd("hyprshot -m active -o ~/Screenshots -z"))

-- ─── System ─────────────────────────────────────────────────────────────────
-- Hyprland Exit
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(
    "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
))

-- Lock
hl.bind("ALT + L", hl.dsp.exec_cmd("hyprlock"))

-- ─── Janelas ─────────────────────────────────────────────────────────────────
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V",  hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P",  hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",  hl.dsp.layout("togglesplit"))   -- dwindle only

-- Foco (hjkl)
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down"  }))

-- Redimensionar (submap para não conflitar)
--hl.submap("resize", function()
--    hl.bind("H",      hl.dsp.window.resize({ x = -30, y = 0 }))
--    hl.bind("L",      hl.dsp.window.resize({ x = 30,  y = 0 }))
--    hl.bind("K",      hl.dsp.window.resize({ x = 0,   y = -30 }))
--    hl.bind("J",      hl.dsp.window.resize({ x = 0,   y = 30 }))
--    hl.bind("Escape", hl.dsp.submap_reset())
--    hl.bind("Return", hl.dsp.submap_reset())
--end)
--hl.bind(mainMod .. " + S", hl.dsp.submap("resize"))

-- Grupos (tabs)
--hl.bind(mainMod .. " + G",            hl.dsp.group.toggle())
--hl.bind(mainMod .. "+ SHIFT + G",      hl.dsp.group.move_into())
--hl.bind(mainMod .. " + Tab",          hl.dsp.group.cycle({ dir = "f"}))
--hl.bind(mainMod .. "+ SHIFT + Tab",    hl.dsp.group.cycle({ dir = "b" }))

-- ─── Workspaces ──────────────────────────────────────────────────────────────
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Workspace especial (scratchpad)
hl.bind(mainMod .. " + minus",       hl.dsp.workspace.toggle_special({ name = "magic" }))
hl.bind(mainMod .. "+ SHIFT + minus", hl.dsp.window.move({ workspace = "special:magic" }))

-- ─── Mouse ───────────────────────────────────────────────────────────────────
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ─── Teclas de mídia ─────────────────────────────────────────────────────────
-- VER DE ADICIONAR APENAS NO NOTEBOOK
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"))

-- ─── Sessão ──────────────────────────────────────────────────────────────────
hl.bind("CTRL + SHIFT + ALT + " .. mainMod .. " + Backspace",
    hl.dsp.exec_cmd("systemctl poweroff"))
