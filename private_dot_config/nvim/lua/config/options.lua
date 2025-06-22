-------------- --
-- vim options --
-- --------------
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"  -- or "yes:4" or "number"

vim.opt.showmode = false  -- use lualine instead
vim.opt.virtualedit = "block"  -- in virtual block mode, pretend there's char
vim.opt.guicursor = "n-c:block,i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250,r-cr-o-v-sm:hor20"  -- set cursor style
vim.opt.termguicolors = true

vim.opt.confirm = true  -- ask when closing file with unsaved changes
vim.opt.undofile = true  -- save undo history after closing
vim.opt.undolevels = 10000

vim.opt.ignorecase = true  -- ignore case when searching
vim.opt.smartcase = true  -- don't ignore case with all capital

vim.opt.splitbelow = true  -- new window below
vim.opt.splitright = true  -- new window right
vim.opt.splitkeep = "screen"  -- keep text on same screen line
vim.opt.inccommand = "split"  -- when substitude, split window to show changes

vim.opt.scrolloff = 4  -- scroll when 4 lines left
vim.opt.wrap = false  -- long line doesn't wrap
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 8

vim.opt.timeout = true
vim.opt.timeoutlen = 200  -- set the window for key pressed
vim.opt.clipboard = "unnamedplus"  -- use register '+' for system clipboard
vim.opt.mouse = "a"

vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = "nvim: %F %y"

-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.mousemoveevent = true
