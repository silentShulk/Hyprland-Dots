-------------------
---- AUTOSTART ----
-------------------

local programs = require("modules.my-programs")

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
    hl.exec_cmd("qs -p ~/.config/quickshell/shell.qml")
    -- my programs
    hl.exec_cmd(programs.terminal)
    hl.exec_cmd("zen-browser")
    hl.exec_cmd("steam")
    hl.exec_cmd("discord")
    -- background
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("awww img ~/.config/hypr/wallpapers/automata/automata.png")
end)