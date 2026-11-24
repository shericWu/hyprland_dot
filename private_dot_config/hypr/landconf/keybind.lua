---------------------
---- KEYBINDINGS ----
---------------------
-- See https://wiki.hypr.land/configuring/core/binds/
-- Old `binde` = { repeating = true }, old `bindm` = { mouse = true }.

local firstMod  = "CONTROL + ALT"
local secondMod = "SHIFT + ALT"
local thirdMod  = "CONTROL + SHIFT + ALT"

local terminal = "kitty"

local function k(mod, key) return mod .. " + " .. key end
local exec = hl.dsp.exec_cmd
local REPEAT = { repeating = true }

------------------
-- Applications --
------------------
hl.bind(k(firstMod, "Q"),  exec(terminal))
hl.bind(k(firstMod, "F"),  exec("fuzzel"))
hl.bind(k(secondMod, "F"), exec("cliphist list | fuzzel -d | cliphist decode | wl-copy"))
hl.bind(k(firstMod, "D"),  exec("firefox --private-window"))
hl.bind(k(firstMod, "S"),  exec("firefox"))
hl.bind(k(firstMod, "E"),  exec("kitty yazi"))
hl.bind("SUPER + Escape",  exec("wlogout -P 0 -n"))
-- `hyprctl dispatch` now takes a Lua dispatcher expression
hl.bind(k(firstMod, "B"),  exec([[hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })']]))

----------
-- Util --
----------
hl.bind("XF86MonBrightnessDown", exec("brightnessctl set 5%-"), REPEAT)
hl.bind("XF86MonBrightnessUp",   exec("brightnessctl set +5%"), REPEAT)
hl.bind("XF86AudioMute",         exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioLowerVolume",  exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), REPEAT)
hl.bind("XF86AudioRaiseVolume",  exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"), REPEAT)

----------------
-- Screenshot --
----------------
hl.bind("Print",           exec([[grim $MY_SCREENSHOT_DIR/$(date '+%Y%m%d-%H%M%S.png')]]))
hl.bind("SHIFT + Print",   exec([[hyprshot -m region -o $MY_SCREENSHOT_DIR -f $(date '+%Y%m%d-%H%M%S.png')]]))
hl.bind("ALT + Print",     exec([[hyprshot -m window -o $MY_SCREENSHOT_DIR -f $(date '+%Y%m%d-%H%M%S.png')]]))
hl.bind("CONTROL + Print", exec([[hyprshot -m output -o $MY_SCREENSHOT_DIR -f $(date '+%Y%m%d-%H%M%S.png')]]))

------------
-- Window --
------------
hl.bind(k(firstMod, "W"), hl.dsp.window.close())                         -- killactive

hl.bind(k(firstMod, "U"),  hl.dsp.window.float({ action = "toggle" }))  -- togglefloating
hl.bind(k(secondMod, "U"), hl.dsp.window.center())                       -- centerwindow 1 (center() respects reserved area)
-- resizeactive exact 70% 70%: resize() no longer accepts percentages, so compute it
hl.bind(k(thirdMod, "U"), function()
    local mon = hl.get_active_monitor()
    if not mon then return end
    hl.dispatch(hl.dsp.window.resize({
        x = math.floor(mon.width  / mon.scale * 0.7),
        y = math.floor(mon.height / mon.scale * 0.7),
    }))
end)

hl.bind(k(firstMod, "P"),  hl.dsp.window.fullscreen({ mode = "maximized" }))  -- fullscreen 1
hl.bind(k(secondMod, "P"), hl.dsp.window.fullscreen({ mode = "fullscreen" })) -- fullscreen 0

local dirs = { H = "left", L = "right", K = "up", J = "down" }
local step = {
    H = { x = -20, y = 0 },  L = { x = 20, y = 0 },
    K = { x = 0, y = -20 },  J = { x = 0, y = 20 },
}
for key, dir in pairs(dirs) do
    -- Move focus with firstMod + vim keys
    hl.bind(k(firstMod, key), hl.dsp.focus({ direction = dir }))
    -- Resize active window
    hl.bind(k(thirdMod, key), hl.dsp.window.resize({ x = step[key].x, y = step[key].y, relative = true }), REPEAT)
    -- Move active window (moveactive)
    hl.bind(k("SUPER", key),  hl.dsp.window.move({ x = step[key].x, y = step[key].y, relative = true }), REPEAT)
    -- movewindoworgroup
    hl.bind(k(secondMod, key), hl.dsp.window.move({ direction = dir, group_aware = true }))
end

-- Split (dwindle preselect)
hl.bind(k(firstMod, "minus"),     hl.dsp.layout("preselect d"))
hl.bind(k(firstMod, "backslash"), hl.dsp.layout("preselect r"))

-----------
-- Group --
-----------
hl.bind(k(secondMod, "semicolon"),    hl.dsp.group.toggle())
hl.bind(k(secondMod, "apostrophe"),   hl.dsp.group.lock({ action = "toggle" }))  -- lockactivegroup toggle
hl.bind(k(secondMod, "bracketleft"),  hl.dsp.group.prev())                       -- changegroupactive b
hl.bind(k(secondMod, "bracketright"), hl.dsp.group.next())                       -- changegroupactive f

---------------
-- Workspace --
---------------
hl.bind(k(firstMod, "O"),  hl.dsp.focus({ workspace = "m+1" }))
hl.bind(k(firstMod, "I"),  hl.dsp.focus({ workspace = "m-1" }))
hl.bind(k(secondMod, "O"), hl.dsp.window.move({ workspace = "m+1" }))
hl.bind(k(secondMod, "I"), hl.dsp.window.move({ workspace = "m-1" }))

-- Special workspaces (toggle_special takes the name WITHOUT "special:")
hl.bind(k(firstMod, "M"),  hl.dsp.workspace.toggle_special("magic-1"))
hl.bind(k(firstMod, "N"),  hl.dsp.workspace.toggle_special("magic-2"))
hl.bind(k(secondMod, "M"), hl.dsp.window.move({ workspace = "special:magic-1" }))
hl.bind(k(secondMod, "N"), hl.dsp.window.move({ workspace = "special:magic-2" }))
hl.bind(k(thirdMod, "M"),  hl.dsp.window.move({ workspace = "e+0" }))
hl.bind(k(thirdMod, "N"),  hl.dsp.window.move({ workspace = "e+0" }))

-- Switch workspaces with firstMod + [0-9]
-- Move active window to a workspace with firstMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = tostring(i % 10) -- 10 -> key 0
    hl.bind(k(firstMod, key),              hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(k(firstMod .. " + SHIFT", key), hl.dsp.window.move({ workspace = tostring(i) }))
end

-- Move/resize windows with firstMod + LMB/RMB and dragging
hl.bind(k(firstMod, "mouse:272"), hl.dsp.window.drag(),   { mouse = true })
hl.bind(k(firstMod, "mouse:273"), hl.dsp.window.resize(), { mouse = true })
