-- ╔══════════════════════════════════════════════════════════════╗
-- ║              hyprland.lua — Entry Point                      ║
-- ║         ~/.config/hypr/hyprland.lua                          ║
-- ╚══════════════════════════════════════════════════════════════╝
--
-- Estrutura:
--   hyprland.lua          ← você está aqui
--   modules/
--     look_and_feel.lua   ← general, decoration, animations, misc
--     keybinds.lua        ← atalhos de teclado e mouse
--     windowrules.lua     ← regras de janelas e workspaces
--     autostart.lua       ← programas que iniciam com o Hyprland
--   hosts/
--     notebook.lua        ← monitor, layout, keybinds exclusivos do notebook
--     desktop.lua         ← monitor, layout, keybinds exclusivos do PC


-- ─── Detecção de host ─────────────────────────────────────────────────────────
-- Verifique o hostname de cada máquina com: $ hostname
local NOTEBOOK_HOSTNAME = "ian-note"   -- ← troque pelo resultado de `hostname` no seu notebook
local DESKTOP_HOSTNAME  = "ianaldosg"    -- ← troque pelo resultado de `hostname` no seu PC

--local function get_hostname()
--    local handle = io.popen("hostname")
--    if not handle then return "" end
--    local result = handle:read("*l") or ""
--    handle:close()
--    return result:gsub("%s+", "")
--end

local function get_hostname()
    local f = io.open("/etc/hostname", "r")
    if not f then return "" end
    local result = f:read("*l") or ""
    f:close()
    return result:gsub("%s+", "")
end

local hostname = get_hostname()

-- ─── Módulos comuns (carregados em TODOS os hosts) ───────────────────────────
require("modules/look_and_feel")
require("modules/keybinds")
require("modules/windowrules")
require("modules/autostart")

-- ─── Config específica por host ──────────────────────────────────────────────
if hostname == NOTEBOOK_HOSTNAME then
    require("hosts/notebook")
elseif hostname == DESKTOP_HOSTNAME then
    require("hosts/desktop")
else
    -- Fallback: carrega config comum genérica se hostname não reconhecido
    --require("hosts/common")
    --hl.notify("warn", "Host '" .. hostname .. "' não reconhecido — usando config genérica.")
    hl.on("hyprland.start", function()
        hl.exec_cmd("notify-send -u critical 'Hyprland' 'Host nao reconhecido. Edite hyprland.lua!'")
    end)
    require("hosts/common")
end


-- ─── Variáveis de ambiente ───────────────────────────────────────────────────
hl.env("XCURSOR_SIZE",    "24")
hl.env("HYPRCURSOR_SIZE", "24")
