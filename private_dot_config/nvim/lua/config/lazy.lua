---------------------- --
-- Bootstrap lazy.nvim --
-- ----------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

------------- --
-- leader key --
-- -------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

------------------ --
-- Setup lazy.nvim --
-- ------------------
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins.looks" },
        { import = "plugins.lsp" },
        { import = "plugins.utils" },
    },
    -- colorscheme that will be used when installing plugins.
    install = {
        colorscheme = { "catppuccin" }
    },
    ui = {
        size = {
            width = 0.7,
            height = 0.7,
        },
        border = "rounded",
        backdrop = 40,
    },
    -- automatically check for plugin updates
    checker = {
        enabled = true
    },
})