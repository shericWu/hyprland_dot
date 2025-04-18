# `Neovim`

<!--toc:start-->
- [`Neovim`](#neovim)
  - [lazy.nvim](#lazynvim)
  - [Required system packages](#required-system-packages)
  - [`LSP`](#lsp)
  - [TODO](#todo)
  - [Linter](#linter)
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
$ yay -S cppman
$ cppman -c  && cppman -m  # cash and import to `man`
```

## `LSP`
| language | LSP |
|:-:|:-:|
| c, c++ | clangd |
| lua | lua-language-server |
| markdown | markdown-oxide, marksman |
| python | pyright |

## Linter (bad)
- For `vale`, see [issue](https://github.com/mfussenegger/nvim-lint/issues/528).
    - After installed via `Mason`, make sure `~/.config/vale/.vale.ini` exists.
    - Run `~/.local/share/nvim/mason/packages/vale/vale --config=$HOME/.config/vale/.vale.ini sync`

## Latex
```sh
$ pacman -S texlive
```
## Python
- packages
```sh
$ pacman -S opencl-clover-mesa opencl-nvidia ocl-icd clinfo python-pyopencl cuda python-pycuda python-pytorch-opt-cuda python-torchvision-cuda
$ pacman -S python-pip python-pipx python-virtualenv
```
- create venv
```sh
$ virtualenv --system-site-packages ./path/to/venv
$ source ./path/to/venv/bin/activate
# do something in venv
$ deactivate
```
