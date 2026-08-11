---------------------
---- KEYBINDINGS ----
---------------------

local programs = require("modules.my-programs")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local closeWindowBind = hl.bind(mainMod.. "+ Q", hl.dsp.window.close()) -- closeWindowBind:set_enabled(false)
local killWindowBind = hl.bind(mainMod.. "+ K", hl.dsp.exec_cmd("hyprctl kill"))

local terminalBind = hl.bind(mainMod.. "+ Return", hl.dsp.exec_cmd(programs.terminal))
local fileManagerBind = hl.bind(mainMod.. "+ E", hl.dsp.exec_cmd(programs.fileManager))
local menuBind = hl.bind("ALT".. "+ SPACE", hl.dsp.exec_cmd(programs.menu))

local hyprpickerHexBind = hl.bind(mainMod.. "+ P +H", hl.dsp.exec_cmd("hyprpicker -a -n -f hex"))
local hyprpickerRGBBind = hl.bind(mainMod.. "+ P +R", hl.dsp.exec_cmd("hyprpicker -a -n -f hex -o \"rgb({0}, {1}, {2})\""))

local hyprshotScreenBind = hl.bind(mainMod.. "+ S", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))
local hyprshotRegionBind = hl.bind(mainMod.. "+ SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -"))

local floatBind = hl.bind(mainMod.. "+ V", hl.dsp.window.float({ action = "toggle" }))
local fullscreenBind = hl.bind(mainMod.. "+ SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))

local logoutBind = hl.bind(mainMod.. "+ M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

local networkManagerBind = hl.bind(mainMod.. "+ ALT + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprltm-net.sh"))
local waybarReloadBind = hl.bind(mainMod.. "+ ALT + R", hl.dsp.exec_cmd("~/.config/waybar/reload-waybar.sh"))



-- Workspace navigation
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 3 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,                hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + CTRL + " .. key,         hl.dsp.window.move({ workspace = i }))
end
for i = 1, 3 do
    local key = i % 10
    hl.bind(mainMod .. " + SHIFT + " .. key,        hl.dsp.focus({ workspace = i+3 }))
    hl.bind(mainMod .. " + SHIFT + CTRL + " ..key,  hl.dsp.window.move({ workspace = i+3 }))
end



-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
