-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- See https://wiki.hypr.land/configuring/core/environment-variables/
-- Lua strings don't expand $HOME, so it is read with os.getenv().

local HOME = os.getenv("HOME")

hl.env("EDITOR", "nvim")
hl.env("SUDO_EDITOR", "vim")
hl.env("XDG_CONFIG_HOME", HOME .. "/.config")
hl.env("MY_SCREENSHOT_DIR", HOME .. "/Pictures/screenshots")

hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_THEME", "Catppuccin-Mocha-Dark")

-- For nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
-- hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- For nvidia and firefox
hl.env("MOZ_X11_EGL", "1")
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
-- (duplicate LIBVA_DRIVER_NAME line from the old file dropped; it was set above)
hl.env("MOZ_DRM_DEVICE", "card0")
-- hl.env("MOZ_LOG", "FFmpegVideo:5")

hl.env("GDK_SCALE", "1.5")

hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
-- NOTE: "GTX_IM_MODULE" is a typo for GTK_IM_MODULE in the original; kept as-is so behavior
-- doesn't change (fcitx5 actually recommends NOT setting GTK_IM_MODULE on Wayland).
hl.env("GTX_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")

-----------------
-- zsh vi-mode --
-----------------
hl.env("VI_MODE_RESET_PROMPT_ON_MODE_CHANGE", "true")
hl.env("VI_MODE_SET_CURSOR", "true")
hl.env("VI_MODE_CURSOR_NORMAL", "2")
hl.env("VI_MODE_CURSOR_VISUAL", "3")
hl.env("VI_MODE_CURSOR_INSERT", "5")
hl.env("VI_MODE_CURSOR_OPPEND", "0")
