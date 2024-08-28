# Post Installation
## Network Manager
See [NetworkManager](https://wiki.archlinux.org/title/NetworkManager).
```sh
$ systemctl start NetworkManager
$ systemctl enable NetworkManager
$ nmcli device wifi list
$ nmcli device wifi connect <SSID> --ask
```

## Select the mirrors
See [Mirrors](https://wiki.archlinux.org/title/Mirrors).  
Get some up-to-date local mirrors.
```sh
$ rankmirrors -n 0 -v /etc/pacman.d/mirrorlist-backup > /etc/pacman.d/mirrorlist
$ pacman -Syyuu
```

## Time synchronization
See [systemd-timesyncd](https://wiki.archlinux.org/title/Systemd-timesyncd).
```sh
$ systemctl start systemd-timesyncd
$ systemctl enable systemd-timesyncd
# edit /etc/systemd/timesyncd.conf
$ systemctl restart systemd-timesyncd
$ timedatectl set-ntp true
```

## Grub and dual-booting
```sh
$ os-prober  # should see windows detected
$ grub-mkconfig -o /boot/grub/grub.cfg
```

## Hibernate
See [Power management/Suspend and hibernate](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Pass_hibernate_location_to_initramfs).   
Edit `/etc/mkinitcpio.conf`.
- add `resume` to `HOOKS=(...)`
- `$ mkinitcpio -P`
Edit `/etc/default/grub`
- add `resume=UUID=<UUID of swap>` to `GRUB_CMDLINE_LINUX_DEFAULT="..."`
  - or use `resume="LABEL=SWAP"` instead
- `$ grub-mkconfig -o /boot/grub/grub.cfg`

## Add user
See [User management](https://wiki.archlinux.org/title/Users_and_groups#User_management) and [sudo](https://wiki.archlinux.org/title/sudo).
```sh
$ useradd -m -s <shell> <username>
$ passwd <username>
# enable "wheel" group and add "Defaults passwd_timeout=0"
$ visudo /etc/sudoers.d/wheel
$ visudo /etc/sudoers.d/timeout
$ usermod -aG wheel <username>
```

## Audio
See [Advanced Linux Sound Architecture](https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture).  
Use alsa, pipewire later.
```sh
$ alsactl init
$ alsamixer
$ alsactl store
$ systemctl restart alsa-restore.service
# create /etc/asound.conf
    # add `defaults.pcm.card 1`
    # add `defaults.ctl.card 1`
```

## Firewall
See [Uncomplicated Firewall](https://wiki.archlinux.org/title/Uncomplicated_Firewall).
```sh
$ pacman -S ufw
$ systemctl start ufw.service
$ systemctl enable ufw.service
$ ufw enable
$ ufw status
```

## Git
```sh
$ git config --global user.name <name>
$ git config --global user.email <email>
$ git config --global core.editor <editor>
$ git config --global init.defaultBranch main
$ git config --global --feature.manyFiles true
$ ssh-keygen -t
```

## Snapshot
```sh
$ pacman -S timeshift xorg-xhost
```

## Manage dot files
See [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux)
### Github
```sh
$ ssh-keygen -t ed25519 -C "your_email@example.com"
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
# add key to github
```
### Chezmoi
See [chezmoi](https://www.chezmoi.io/quick-start/).
```sh
$ pacman -S chezmoi
$ chezmoi init
```

## Input method
```sh
$ pacman -S fcitx5 fcitx5-chewing fcitx5-kkc fcitx5-configtool
$ yay -S fcitx5-mozc
$ fcitx5-configtool  # open gui configuration
```

## Misc
### Pacman
Edit `/etc/pacman.conf`
- Uncomment `Color`
- Add `ILoveCandy`
- Uncomment `ParallelDownloads`

See [Alternatives](https://wiki.archlinux.org/title/Core_utilities#Alternatives).
| packages |
|:-:|
| `lsd` |

### Modify linux console (tty)
See [Linux console](https://wiki.archlinux.org/title/Linux_console)

For colors, [catppuccin/tty](https://github.com/catppuccin/tty).
```sh
$ git clone https://github.com/catppuccin/tty
$ ./tty/gnerate.sh mocha
# modify /etc/default/grub
    # add vt.default_red=... to GRUB_CMDLIEN_LINUX
$ grub-mkconfig -o /boot/grub/grub.cfg
```

For fonts, see [xxxserxxx/gotop](https://github.com/xxxserxxx/gotop/tree/master/fonts).
```sh
$ mv ~/Downloads/Lat15-VGA16-braille.psf /usr/share/kbd/consolefonts/
# edit /etc/vconsole.conf
    # add FONT=Lat15-VGA16-braille
```
Use [Braille ascii art](https://lachlanarthur.github.io/Braille-ASCII-Art) to generate.

### Grub UI
See [GRUB/Tips and tricks](https://wiki.archlinux.org/title/GRUB/Tips_and_tricks).  
Theme modified from [catppuccin](https://github.com/catppuccin/grub), [vinceliuice](https://github.com/vinceliuice/grub2-themes) and [sandesh236](https://github.com/sandesh236/sleek--themes)
```sh
$ pacman -S hwinfo  # to list supported resolution
$ cp -r <path to theme> /usr/share/grub/themes
```
### Useful program
| name | description |
|:-:|:-:|
| `plocate` | Index file system and find files fast |
| `socat` | Interact with `Hyprland` socket |
| `jq` | Parse .json file, useful with `hyprctl -j` |
| `$ pacman -S $(pacman -Sgq nerd-fonts)` | All the nerd fonts |
| `noto-fonts-cjk` | Chinese, Japanese, Korean fonts |
| `nwg-look` | Edit GTK3 settings on wayland |
| `bun` | Compiler for typescript |
| `calcurse` | Calendar & scheduler |
| `patroneo` | Music maker |
| `ttyper` | Typing practice |
| `qpwgraph` | PipeWire GUI |
| `easyeffects` | PipeWire effects |
| `rsync` | Copy |
| `thefuck` | Fat finger saver |
| `udisk2` | Mount file system |
