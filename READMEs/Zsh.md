# zsh
## oh-my-zsh
```sh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ pacman -S zsh-autosuggestions zsh-completions zsh-syntax-highlighting
$ cd ~/.oh-my-zsh/custom/plugins
$ ln -s /usr/share/zsh/plugins/zsh-autosuggestions ./zsh-autosuggestions
$ ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting ./zsh-syntax-highlighting
```
### Theme: Starship
```sh
$ pacman -S starship
```
