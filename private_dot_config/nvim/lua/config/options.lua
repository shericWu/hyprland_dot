-------------- --
-- vim options --
-- --------------
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- or "yes:4" or "number"

-- set the window for key pressed
vim.opt.timeoutlen = 200

-- set cursor style
vim.opt.guicursor = "n-c:block,i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250,r-cr-o-v-sm:hor20"

-- ask when closing file with unsaved changes
vim.opt.confirm = true

-- save undo history after closing
vim.opt.undofile=true
