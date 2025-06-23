# Hyprland
See [Hyprland (arch wiki)](https://wiki.archlinux.org/title/Hyprland) and [Master tutorial (hyprland wiki)](https://wiki.hyprland.org/Getting-Started/Master-Tutorial/)
```sh
$ pacman -S hyprland kitty
# For nvidia gpu
    $ pacman -S linux-headers nvidia-dkms nvidia-utils egl-wayland polkit gtk3 gtk4
    # edit /etc/pacman.conf
        # uncomment [multilib]
        # uncomment Include = /etc/pacman.d/mirrorlist
    $ pacman -Syu
    $ reboot
    $ pacman -S lib32-nvidia-utils libva-nvidia-driver libva-utils
    # edit /etc/default/grub
        # [Notice: no "nvidia."]
        # add NVreg_PreserveVideoMemoryAllocations=1 to GRUB_CMDLINE_LINUX_DEFAULT
    $ grub-mkconfig -o /boot/grub/grub.cfg
    # edit /etc/mkinitcpio.conf
        # add `nvidia nvidia_modeset nvidia_uvm nvidia_drm` to MODULES
    # create /etc/modprobe.d/nvidia.conf
        # add `options nvidia_drm modeset=1 fbdev=1`
    $ mkinitcpio -P
    # edit /usr/share/hyprland/hyprland.conf
        # add the following lines
        env = LIBVA_DRIVER_NAME,nvidia
        env = XDG_SESSION_TYPE,wayland
        env = GBM_BACKEND,nvidia-drm
        env = __GLX_VENDOR_LIBRARY_NAME,nvidia
        env = NVD_BACKEND,direct
        cursor {
            no_hardware_cursors = true
        }
    # For suspend & hibernate
    $ systemctl enable nvidia-suspend.service
    $ systemctl enable nvidia-hibernate.service
    $ systemctl enable nvidia-resume.service
    $ reboot
# End for nvidia gpu
$ Hyprland
# paste the added lines in hyprland.conf to ~/.config/hypr/hyprland.conf
```

## hardware_acceleration
See [Hardware_video_acceleration](https://wiki.archlinux.org/title/Hardware_video_acceleration).
Try it later.

## Must have
See [must have](https://wiki.hyprland.org/Useful-Utilities/Must-have/).

### A notification daemon
```sh
$ pacman -S swaync
$ cp /etc/xdg/swaync/config.json ~/.config/swaync/config.json
$ cp /etc/xdg/swaync/style.css ~/.config/swaync/style.css
$ swaync-client --reload-config
# edit hyprland.conf
    # add `swaync` to "exec-once = ..."
```

### Pipewire
See [pipewire-guide](https://github.com/mikeroyal/PipeWire-Guide)
```sh
$ pacman -S pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack
$ reboot
```

### Bluetooth
See [bluetooth](https://wiki.archlinux.org/title/Bluetooth)
```sh
$ pacman -S bluez bluez-utils blueman
# `$ lsmod | grep -- 'btusb'` check if modules is loaded
$ systemctl start bluetooth.service
$ systemctl enable bluetooth.service
```

### XDG Desktop Portal
```sh
$ pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-desktop-portal-wlr
```

### Authentication Agent
```sh
$ pacman -S polkit-kde-agent
# edit hyprland.conf
    # add `/usr/lib/polkit-kde-authentication-agent-1` to `exec-once = ...`
```

### Qt Wayland Support
```sh
$ pacman -S qt5-wayland qt6-wayland
```

## Firefox (browser)
See [nvidia-vaapi-driver - firefox](https://github.com/elFarto/nvidia-vaapi-driver?tab=readme-ov-file#firefox) and [firerfox - configuration](https://wiki.archlinux.org/title/firefox#Configuration).
```sh
$ pacman -S firefox
    # choose jack2
# For other language
$ pacman -S noto-fonts-cjk
# For Nvidia gpu
    $ pacman -S ffmpeg
    # check with $ ffmpeg -hwaccels
    # enter "about:config" in search bar
    # edit according to nvidia-vaapi-driver's README
    # edit /etc/environment
    # edit /etc/libva.conf
```
- Note: If encounter Firefox crashed when playing video, remove `env = GBM_BACKEND,nvidia-drm` in `hyprland.conf`

### Tree Style Tab
- Go to `about:config`
    - Set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
- Go to `about:support`
    - Open `Profile Directory`
    - `$ mkdir chrome && cd chrome`
    - `$ touch userChrome.css`

## Yay (aur helper)
See [Yay](https://github.com/Jguer/yay).
```sh
$ pacman -S git base-devel
$ mkdir Programs $ cd Programs
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
$ yay -Y --gendb
$ yay -Syu --devel
$ yay -Y --devel --save
```

## login/logout...
### Greetd + tuigreet (display manager)
```sh
$ pacman -S greetd greetd-tuigreet
# disable sddm
$ systemctl enable greetd.service
# configure /etc/greetd/config.toml
```

### hypridle
See [github](https://github.com/hyprwm/hypridle) and [wiki](https://wiki.hyprland.org/Hypr-Ecosystem/hypridle/).
```sh
$ pacman -S hypridle
$ touch ~/.config/hypr/hypridle.conf
# edit hypridle.conf
```
```sh
$ pacman -S brightnessctl
```

### hyprlock
See [github](https://github.com/hyprwm/hyprlock) and [wiki](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/).
```sh
$ pacman -S hyprlock
$ touch ~/.config/hypr/hyprlock.conf
# edit hyprlock.conf
```

### wlogout
See []() and [さんばか](https://www.pixiv.net/artworks/79221278)
```sh
$ yay -S wlogout
$ mkdir ~/.config/wlogout
$ cp /etc/wlogout/* ~/.config/wlogout
# edit layout and style.css
```
For style check see [CSS Properties](https://docs.gtk.org/gtk3/css-properties.html).

## imv (image viewer)
See [imv](https://sr.ht/~exec64/imv/).
```sh
$ pacman -S imv
```

## yazi (file manager)
```sh
$ pacman -S yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide ttf-dejavu ttf-dejavu-nerd
```

## fuzzel (app launcher)
```sh
$ pacman -S fuzzel
```

## kitty
```sh
$ cp /usr/share/doc/kitty/kitty.conf ~/.config/kitty
```

## Screenshot
Use grim + slurp.
```sh
$ pacman -S grim slurp
$ grim -g '$(slurp)'  # take screenshot
# for binding
$ pacman -S wev  # to get keycode
$ yay -S hyprpicker  # for screen freeze
# edit hyprland.conf to set keybinds
```
Another method.
```sh
$ yay -S hyprshot  # works out of the box
```

## Clipboard
See [github](https://github.com/sentriz/cliphist) and [wiki](https://wiki.hyprland.org/Useful-Utilities/Clipboard-Managers/#cliphist).
```sh
$ pacman -S cliphist
# edit hyprland.conf
# exec-once = wl-paste --type text --watch cliphist store
# exec-once = wl-paste --type image --watch cliphist store
# bind = Ma
```

## Discord client
```sh
$ yay -S vesktop
```

## Plugings
```sh
$ pacman -S cpio meson cmake hyprwayland-scanner
$ hyprpm add https://github.com/hyprwm/hyprland-plugins
```

## Looks
### Waybar (deprecated)
See [Waybar](https://github.com/Alexays/Waybar).
```sh
$ pacman -S waybar
$ mkdir ~/.config/waybar
$ cp /etc/xdg/waybar/* ~/.config/waybar
# replace `sway/workspaces` with `hyprland/workspaecs`
$ sed -i 's/sway\/workspaces/hyprland\/workspaces/g' ~/.config/waybar/config.jsonc
$ sed -i 's/sway\/workspaces/hyprland\/workspaces/g' ~/.config/waybar/style.css
$ usermod --append --groups input sheric
```
### Ags (Replacement of waybar)
```sh
$ pacman -S fyi
$ yay -S aylurs-gtk-shell-git libastal-io-git libastal-git
$ ags init  # create ~/.config/ags/
$ ags bundle ./app.ts ./bar.js  # in ~/.config/ags/
$ gjs -m ./bar.js
```
If css looks wierd
- `$ nwg-look`
- Choose Theme: `Orchis-Dark-Compact`
    - Icon Theme: `Tela-dark`

### swww (current)
For some reason, the image from hyprpaper seems blurring, use [swww](https://github.com/LGFae/swww) instead.
```sh
$ pacman -S swww
# edit `hyprland.conf`
```

### flavours
```sh
$ yay -S flavours
$ flavours update all
```

### kitty
```sh
$ kitty +kitten themes
# choose `Catppuccin-Mocha`
$ mkdir ~/.config/kitty/themes
$ cp ~/.config/kitty/current-theme.conf ~/.config/kitty/themes/Catppuccin-Mocha.conf
$ kitty +kitten themes
# choose `Catppuccin-Mocha` again
$ kitten themes --reload-in=all Catppuccin-Mocha
```

### GTK Theme
```sh
$ pacman -S nwg-look
$ yay -S orchis-theme nordic-theme
$ git clone https://github.com/vinceliuice/Tela-icon-theme
$ ./install.sh -a  # for tela icon
$ yay -S catppuccin-cursors-mocha
$ cp -r /usr/share/icons/catppuccin-mocha-dark-cursors ~/.local/share/icons
# change gtk themes in nwg-look
# for hyprcursor, set environment variables
```

### Cava
```sh
$ yay -S cava
$ cava  # to generate config at ~/.config/cava
# change method to pipewire
$ kitty +kitten pannel cava  # spawn cava at desktop
```

### Music player
```sh
$ pacman -S quodlibet gst-libav gst-plugin-pipewire
```

### AGS
```sh
$ yay -S aylurs-gtk-shell
```
