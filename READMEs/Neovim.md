# Neovim
## lazy.nvim
See [Getting Started](https://lazy.folke.io/).
Note that `lazy.nvim` and `LazyVim` are different.
| File | Purpose |
|:-:|:-:|
| ~/.config/nvim/init.lua | Load other configs and lazy |
| ~/.config/nvim/lua/config | Vim config and lazy. |
| ~/.config/nvim/lua/plugins | All the plugins in here. |

```sh
:checkhealth lazy  # install luarocks if needed
```

## treesitter
```sh
$ pacman -S tree-sitter-cli nodejs
```
