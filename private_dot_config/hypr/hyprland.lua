-- Hyprland 0.57+ Lua config (converted from the old hyprlang hyprland.conf)
-- Wiki: https://wiki.hypr.land/configuring/

-- Old `source = ...` lines become require() calls.
-- Paths are relative to this file: landconf.env -> ~/.config/hypr/landconf/env.lua
-- Each require() runs in its own scope, so an error in one file won't stop the others.
require("landconf.env")
require("landconf.exec")
require("landconf.rule")
require("landconf.keybind")
require("landconf.plugin")


------------------
---- MONITORS ----
------------------

hl.monitor({ output = "eDP-1", mode = "1920x1080", position = "0x0", scale = 1 })
hl.monitor({ output = "",      mode = "preferred", position = "auto", scale = "auto" })


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        border_size = 3,
        gaps_in     = 6,
        gaps_out    = 12,
        col = {
            active_border   = { colors = { "rgba(b4befeee)", "rgba(89b4faee)" }, angle = 90 },
            inactive_border = "rgba(6c7086ee)",
        },

        layout = "dwindle",

        resize_on_border        = true,
        extend_border_grab_area = 5,

        allow_tearing = false,
    },

    decoration = {
        rounding = 12,

        active_opacity     = 1.0,
        inactive_opacity   = 1.0,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        dim_special = 0.5,

        blur = {
            enabled  = false,
            size     = 1,
            passes   = 3,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled              = true,
        workspace_wraparound = true,
    },
})

hl.curve("easeOutCubic", { type = "bezier", points = { {0.215, 0.61}, {0.355, 1}    } })
hl.curve("easeOutQuad",  { type = "bezier", points = { {0.25,  0.46}, {0.45,  0.94} } })

hl.animation({ leaf = "windows",          enabled = true, speed = 4,  bezier = "easeOutCubic" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 8,  bezier = "easeOutQuad",  style = "popin 70%" })
hl.animation({ leaf = "border",           enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle",      enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",             enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 6,  bezier = "easeOutCubic", style = "slidefade" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 6,  bezier = "easeOutCubic", style = "slidefadevert" })


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_model   = "",
        kb_layout  = "us",
        kb_variant = "",
        kb_options = "ctrl:swapcaps",
        kb_rules   = "",
        numlock_by_default = true,
        repeat_delay = 240,
        repeat_rate  = 40,
        sensitivity  = 0,

        follow_mouse = 2,

        special_fallthrough = true,

        touchpad = {
            disable_while_typing = true,
            natural_scroll       = false,
            drag_lock            = 1, -- was `true`; now an int: 0 off, 1 on (with timeout), 2 sticky
        },

        -- tablet = {
        --     output = "DP-3",
        --     region_position = "0 0",
        --     -- active_area_size = "152 95"  -- full area
        --     active_area_size     = "48 27",
        --     active_area_position = "61 6.5",
        -- },
    },
})


---------------
---- GROUP ----
---------------

hl.config({
    group = {
        col = {
            border_active          = { colors = { "rgba(b4befeee)", "rgba(89b4faee)" }, angle = 90 },
            border_inactive        = "rgba(6c7086ee)",
            border_locked_active   = { colors = { "rgba(94e2d5ee)", "rgba(a6e3a1ee)" }, angle = 90 },
            border_locked_inactive = "rgba(6c7086ee)",
        },

        groupbar = {
            font_size = 12,
            col = {
                active          = "rgba(b4befeee)",
                inactive        = "rgba(6c7086ee)",
                locked_active   = "rgba(94e2d5ee)",
                locked_inactive = "rgba(6c7086ee)",
            },
        },
    },
})


--------------
---- MISC ----
--------------

hl.config({
    misc = {
        disable_hyprland_logo   = true,
        font_family             = "ComicShannsMono Nerd Font",
        force_default_wallpaper = 0,
    },

    binds = {
        focus_preferred_method = 1,
    },

    cursor = {
        no_hardware_cursors = 1, -- was `true`; int: 0 hw if possible, 1 never hw, 2 auto
        hide_on_key_press   = true,
    },

    dwindle = {
        -- pseudotile = true,
        preserve_split      = true,
        smart_resizing      = false,
        force_split         = 2,
        default_split_ratio = 1.0,
    },

    master = {
        new_status = "master",
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

-- The old empty `gestures { }` block had no effect and is dropped.
-- Touchpad gestures are now declared with hl.gesture({ ... }) if you want any.
