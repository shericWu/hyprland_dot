-------------------
---- AUTOSTART ----
-------------------
-- `exec-once` is now the "hyprland.start" event.
-- hl.exec_cmd runs through `sh -c`, so $HOME and redirections still work.

hl.on("hyprland.start", function()
    -- hl.exec_cmd("nm-applet")
    hl.exec_cmd("swww-daemon")
    -- hl.exec_cmd("swww img ~/Pictures/bg/bg5.png --resize=no --transition-type=center --transition-fps=60 --transition-duration=2")
    hl.exec_cmd("$HOME/.config/hypr/script/createWS.sh > /dev/null")
    -- hl.exec_cmd("waybar")
    hl.exec_cmd("gjs -m $HOME/.config/ags/bar.js")
    hl.exec_cmd("fcitx5 -d --replace")
    hl.exec_cmd("swaync")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("tldr --update")
end)
