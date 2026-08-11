--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local programs = require("modules.my-programs")

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- CUSTOM WINDOW RULES
hl.window_rule({
    name = "browser-ws",
    match = { 
        class = programs.browser
    },

    workspace = "2"
})
hl.window_rule({
    name = "steam-ws",
    match = {
        class = "steam"
    },

    workspace = "4"
})
hl.window_rule({
    name = "discord-ws",
    match = {
        class = "discord"
    },

    workspace = "5"
})

hl.window_rule({
    name = "ata-float",
    match = {
        class="^(ata|ATA).*",
        title="^(ata|ATA).*"
    },

    float = true
})

-- Example window rules that are useful
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
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

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
