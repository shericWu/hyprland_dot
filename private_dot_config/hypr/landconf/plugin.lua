-------------------------
---- PLUGIN SETTINGS ----
-------------------------
-- NOTE: hyprwinwrap was removed from hyprwm/hyprland-plugins in May 2026
-- ("all: drop unmaintained plugins", #663), so `hyprpm` can no longer install it
-- for 0.57. This block only applies if a 0.57-compatible build is loaded.
-- Loading a plugin triggers a config reload, so the check passes once it's in.

local function plugin_loaded(name)
    for _, p in pairs(hl.get_loaded_plugins()) do
        if p.name == name then return true end
    end
    return false
end

if plugin_loaded("hyprwinwrap") then
    hl.config({
        plugin = {
            hyprwinwrap = {
                -- class is an EXACT match and NOT a regex!
                class = "kitty-bg",
            },
        },
    })
end
