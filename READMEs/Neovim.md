# Neovim

<!--toc:start-->
- [Neovim](#neovim)
  - [lazy.nvim](#lazynvim)
  - [Required system packages](#required-system-packages)
  - [lsp](#lsp)
  - [TODO](#todo)
<!--toc:end-->

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

## Required system packages
```sh
$ pacman -S tree-sitter-cli nodejs npm ripgrep fd make git-delta wget
```

## lsp
| language | lsp |
|:-:|:-:|
| c, c++ | clangd |
| lua | lua-language-server |
| markdown | markdown-oxide, marksman |

## TODO
- lsp settings
- nvim-cmp
- dap (and telescope pluging)
