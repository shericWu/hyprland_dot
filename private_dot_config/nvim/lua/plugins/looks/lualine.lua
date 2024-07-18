return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/noice.nvim",
        "stevearc/aerial.nvim"
    },

    config = function()
        require("lualine").setup({
            options = {
                themes = "catppuccin",
                disabled_filetypes = { "dashboard", "NvimTree" },
            },
            sections = {
                lualine_x = {
                    {
                        "aerial",
                    },
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                    }
                }
            }
        })
    end,
}
